
import { BaseFeature } from './feature/base/BaseFeature'
import { RatelimitFeature } from './feature/ratelimit/RatelimitFeature'
import { RetryFeature } from './feature/retry/RetryFeature'
import { TestFeature } from './feature/test/TestFeature'
import { TimeoutFeature } from './feature/timeout/TimeoutFeature'



const FEATURE_CLASS: Record<string, typeof BaseFeature> = {
   ratelimit: RatelimitFeature,
 retry: RetryFeature,
 test: TestFeature,
 timeout: TimeoutFeature,

}


const FEATURE_PLUGINS: Record<string, any[]> = {
  
}


class Config {

  makeFeature(this: any, fn: string) {
    const fc = FEATURE_CLASS[fn]
    const fi = new fc()
    return fi
  }

  // False for a feature added at runtime via options.extend (station's
  // adopt path) - the constructor uses this to skip makeFeature for names
  // no generated class backs.
  hasFeature(this: any, fn: string) {
    return null != FEATURE_CLASS[fn]
  }


  main = {
    name: 'YesOrNo',
        slug: "yes-or-no",
    version: "0.0.1",
    target: "ts",

  }


  feature = {
     ratelimit:     {
      "options": {
        "active": false,
        "burst": 5,
        "rate": 5
      },
      "optspec": {
        "now": "`$FUNCTION`",
        "sleep": "`$FUNCTION`"
      },
      "strict": false,
      "transport": "wrap"
    },
 retry:     {
      "options": {
        "active": false,
        "factor": 2,
        "maxDelay": 2000,
        "minDelay": 50,
        "retries": 2,
        "statuses": [
          408,
          425,
          429,
          500,
          502,
          503,
          504
        ]
      },
      "optspec": {
        "jitter": "`$BOOLEAN`",
        "sleep": "`$FUNCTION`"
      },
      "strict": false,
      "transport": "wrap"
    },
 test:     {
      "options": {
        "active": false
      },
      "optspec": {
        "entity": "`$MAP`",
        "net": "`$MAP`"
      },
      "strict": false,
      "transport": "base"
    },
 timeout:     {
      "options": {
        "active": false,
        "ms": 30000
      },
      "optspec": {
        "clearTimer": "`$FUNCTION`",
        "now": "`$FUNCTION`",
        "setTimer": "`$FUNCTION`"
      },
      "strict": false,
      "transport": "wrap"
    },

  }


  options = {
    base: "https://yesnooracle.app",

    headers: {
      "content-type": "application/json"
    },

    entity: {
      
        oracle: {
        },
  
    }
  }


  entity = {
    "oracle": {
      "fields": [
        {
          "name": "answer",
          "title": "Answer",
          "type": "`$STRING`",
          "req": true,
          "short": "Normalized answer."
        },
        {
          "name": "forced",
          "title": "Forced",
          "type": "`$BOOLEAN`",
          "req": true,
          "short": "True when the verdict was set with the force parameter."
        },
        {
          "name": "image",
          "title": "Image",
          "type": "`$STRING`",
          "req": true,
          "short": "URL of the tool's artwork."
        },
        {
          "name": "phrase",
          "title": "Phrase",
          "type": "`$STRING`",
          "req": true,
          "short": "Themed reflective sentence."
        },
        {
          "name": "tool",
          "title": "Tool",
          "type": "`$STRING`",
          "req": true,
          "short": "The tool that answered."
        },
        {
          "name": "verdict",
          "title": "Verdict",
          "type": "`$STRING`",
          "req": true,
          "short": "Verdict label: 'yes' or 'no' matching answer, or 'again' when answer is 'maybe'."
        },
        {
          "name": "word",
          "title": "Word",
          "type": "`$STRING`",
          "req": true,
          "short": "Themed headline, e.g."
        }
      ],
      "name": "oracle",
      "op": {
        "load": {
          "input": "data",
          "name": "load",
          "points": [
            {
              "kind": "http",
              "method": "GET",
              "orig": "/api/oracle",
              "segments": [
                {
                  "lit": "api"
                },
                {
                  "lit": "oracle"
                }
              ],
              "parts": [
                "api",
                "oracle"
              ],
              "rename": {},
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "args": {
                "query": [
                  {
                    "name": "force",
                    "orig": "force",
                    "type": "`$STRING`",
                    "kind": "query",
                    "example": "yes"
                  },
                  {
                    "name": "tool",
                    "orig": "tool",
                    "type": "`$STRING`",
                    "kind": "query",
                    "example": "tarot",
                    "field": true
                  }
                ]
              },
              "select": {},
              "response": {
                "kind": "json",
                "media": "application/json"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    }
  }
}


const config = new Config()

export {
  config,
  FEATURE_PLUGINS,
}

