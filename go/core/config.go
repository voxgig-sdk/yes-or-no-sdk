package core

import (
	"sync"
)

// MakeConfig builds a fresh, fully materialised config map. Every call
// rebuilds the whole structure, so prefer SharedConfig unless you need a
// private copy you intend to mutate.
func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "YesOrNo",
			"slug": "yes-or-no",
			"version": "0.0.1",
			"target": "go",
		},
		"feature": map[string]any{
			"ratelimit": map[string]any{
				"options": map[string]any{
					"active": false,
					"burst": 5,
					"rate": 5,
				},
				"optspec": map[string]any{
					"now": "`$FUNCTION`",
					"sleep": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "wrap",
			},
			"retry": map[string]any{
				"options": map[string]any{
					"active": false,
					"factor": 2,
					"maxDelay": 2000,
					"minDelay": 50,
					"retries": 2,
					"statuses": []any{
						408,
						425,
						429,
						500,
						502,
						503,
						504,
					},
				},
				"optspec": map[string]any{
					"jitter": "`$BOOLEAN`",
					"sleep": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "wrap",
			},
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
				"optspec": map[string]any{
					"entity": "`$MAP`",
					"net": "`$MAP`",
				},
				"strict": false,
				"transport": "base",
			},
			"timeout": map[string]any{
				"options": map[string]any{
					"active": false,
					"ms": 30000,
				},
				"optspec": map[string]any{
					"clearTimer": "`$FUNCTION`",
					"now": "`$FUNCTION`",
					"setTimer": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "wrap",
			},
		},
		"options": map[string]any{
			"base": "https://yesnooracle.app",
			"headers": map[string]any{
				"content-type": "application/json",
			},
			"entity": map[string]any{
				"oracle": map[string]any{},
			},
		},
		"entity": map[string]any{
			"oracle": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "answer",
						"title": "Answer",
						"type": "`$STRING`",
						"req": true,
						"short": "Normalized answer.",
					},
					map[string]any{
						"name": "forced",
						"title": "Forced",
						"type": "`$BOOLEAN`",
						"req": true,
						"short": "True when the verdict was set with the force parameter.",
					},
					map[string]any{
						"name": "image",
						"title": "Image",
						"type": "`$STRING`",
						"req": true,
						"short": "URL of the tool's artwork.",
					},
					map[string]any{
						"name": "phrase",
						"title": "Phrase",
						"type": "`$STRING`",
						"req": true,
						"short": "Themed reflective sentence.",
					},
					map[string]any{
						"name": "tool",
						"title": "Tool",
						"type": "`$STRING`",
						"req": true,
						"short": "The tool that answered.",
					},
					map[string]any{
						"name": "verdict",
						"title": "Verdict",
						"type": "`$STRING`",
						"req": true,
						"short": "Verdict label: 'yes' or 'no' matching answer, or 'again' when answer is 'maybe'.",
					},
					map[string]any{
						"name": "word",
						"title": "Word",
						"type": "`$STRING`",
						"req": true,
						"short": "Themed headline, e.g.",
					},
				},
				"name": "oracle",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/api/oracle",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"lit": "oracle",
									},
								},
								"parts": []any{
									"api",
									"oracle",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"name": "force",
											"orig": "force",
											"type": "`$STRING`",
											"kind": "query",
											"example": "yes",
										},
										map[string]any{
											"name": "tool",
											"orig": "tool",
											"type": "`$STRING`",
											"kind": "query",
											"example": "tarot",
											"field": true,
										},
									},
								},
								"select": map[string]any{},
								"response": map[string]any{
									"kind": "json",
									"media": "application/json",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
		},
	}
}

// The plugin definitions the model selected per feature, as []any so a
// feature package can consume them without core naming its types. Empty
// when no active feature declares active plugin groups for this target.
var featurePlugins = map[string][]any{
}

// FeaturePlugins is the definitions list for one feature's chain.
func FeaturePlugins(name string) []any {
	return featurePlugins[name]
}

var (
	sharedConfigOnce sync.Once
	sharedConfigVal  map[string]any
)

// SharedConfig returns the process-wide config, built once on first use.
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client.
//
// The returned map is shared: treat it as read-only. Callers that need to
// mutate should use MakeConfig, which always returns a fresh copy.
func SharedConfig() map[string]any {
	sharedConfigOnce.Do(func() {
		sharedConfigVal = MakeConfig()
	})
	return sharedConfigVal
}

func makeFeature(name string) Feature {
	switch name {
	case "ratelimit":
		if NewRatelimitFeatureFunc != nil {
			return NewRatelimitFeatureFunc()
		}
	case "retry":
		if NewRetryFeatureFunc != nil {
			return NewRetryFeatureFunc()
		}
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	case "timeout":
		if NewTimeoutFeatureFunc != nil {
			return NewTimeoutFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}
