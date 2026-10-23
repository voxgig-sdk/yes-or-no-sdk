# YesOrNo SDK configuration

module YesOrNoConfig
  # Return the process-wide config, built once on first use. The SDK reads
  # the config on every request and never writes to it, so one instance is
  # shared by every client rather than rebuilt per client.
  #
  # The returned hash is shared: treat it as read-only. Callers that need to
  # mutate should use make_config, which always returns a fresh copy.
  def self.shared_config
    @shared_config ||= make_config
  end


  # Build a fresh, fully materialised config hash. Every call rebuilds the
  # whole structure, so prefer shared_config unless you need a private copy
  # you intend to mutate.
  def self.make_config
    {
      "main" => {
        "name" => "YesOrNo",
        "slug" => "yes-or-no",
        "version" => "0.0.1",
        "target" => "rb",
      },
      "feature" => {
        "ratelimit" => {
          "options" => {
            "active" => false,
            "burst" => 5,
            "rate" => 5,
          },
          "optspec" => {
            "now" => "`$FUNCTION`",
            "sleep" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
        "retry" => {
          "options" => {
            "active" => false,
            "factor" => 2,
            "maxDelay" => 2000,
            "minDelay" => 50,
            "retries" => 2,
            "statuses" => [
              408,
              425,
              429,
              500,
              502,
              503,
              504,
            ],
          },
          "optspec" => {
            "jitter" => "`$BOOLEAN`",
            "sleep" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
        "test" => {
          "options" => {
            "active" => false,
          },
          "optspec" => {
            "entity" => "`$MAP`",
            "net" => "`$MAP`",
          },
          "strict" => false,
          "transport" => "base",
        },
        "timeout" => {
          "options" => {
            "active" => false,
            "ms" => 30000,
          },
          "optspec" => {
            "clearTimer" => "`$FUNCTION`",
            "now" => "`$FUNCTION`",
            "setTimer" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
      },
      "options" => {
        "base" => "https://yesnooracle.app",
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "oracle" => {},
        },
      },
      "entity" => {
        "oracle" => {
          "fields" => [
            {
              "name" => "answer",
              "title" => "Answer",
              "type" => "`$STRING`",
              "req" => true,
              "short" => "Normalized answer.",
            },
            {
              "name" => "forced",
              "title" => "Forced",
              "type" => "`$BOOLEAN`",
              "req" => true,
              "short" => "True when the verdict was set with the force parameter.",
            },
            {
              "name" => "image",
              "title" => "Image",
              "type" => "`$STRING`",
              "req" => true,
              "short" => "URL of the tool's artwork.",
            },
            {
              "name" => "phrase",
              "title" => "Phrase",
              "type" => "`$STRING`",
              "req" => true,
              "short" => "Themed reflective sentence.",
            },
            {
              "name" => "tool",
              "title" => "Tool",
              "type" => "`$STRING`",
              "req" => true,
              "short" => "The tool that answered.",
            },
            {
              "name" => "verdict",
              "title" => "Verdict",
              "type" => "`$STRING`",
              "req" => true,
              "short" => "Verdict label: 'yes' or 'no' matching answer, or 'again' when answer is 'maybe'.",
            },
            {
              "name" => "word",
              "title" => "Word",
              "type" => "`$STRING`",
              "req" => true,
              "short" => "Themed headline, e.g.",
            },
          ],
          "name" => "oracle",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/oracle",
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "oracle",
                    },
                  ],
                  "parts" => [
                    "api",
                    "oracle",
                  ],
                  "rename" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "query" => [
                      {
                        "name" => "force",
                        "orig" => "force",
                        "type" => "`$STRING`",
                        "kind" => "query",
                        "example" => "yes",
                      },
                      {
                        "name" => "tool",
                        "orig" => "tool",
                        "type" => "`$STRING`",
                        "kind" => "query",
                        "example" => "tarot",
                        "field" => true,
                      },
                    ],
                  },
                  "select" => {},
                  "response" => {
                    "kind" => "json",
                    "media" => "application/json",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    YesOrNoFeatures.make_feature(name)
  end
end
