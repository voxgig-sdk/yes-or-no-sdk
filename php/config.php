<?php
declare(strict_types=1);

// YesOrNo SDK configuration

class YesOrNoConfig
{
    /** @var array<string,mixed>|null */
    private static ?array $shared_config = null;

    /**
     * Return the process-wide config, built once on first use. The SDK reads
     * the config on every request and never writes to it, so one instance is
     * shared by every client rather than rebuilt per client.
     *
     * PHP arrays are copy-on-write, so callers that do mutate the result get
     * their own copy and cannot disturb the shared one.
     */
    public static function shared_config(): array
    {
        if (self::$shared_config === null) {
            self::$shared_config = self::make_config();
        }
        return self::$shared_config;
    }

    /**
     * Build a fresh, fully materialised config array. Every call rebuilds the
     * whole structure, so prefer shared_config unless you need a private copy.
     */
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "YesOrNo",
                "slug" => "yes-or-no",
                "version" => "0.0.1",
                "target" => "php",
            ],
            "feature" => [
                "ratelimit" => [
          'options' => [
            'active' => false,
            'burst' => 5,
            'rate' => 5,
          ],
          'optspec' => [
            'now' => '`$FUNCTION`',
            'sleep' => '`$FUNCTION`',
          ],
          'strict' => false,
          'transport' => 'wrap',
        ],
                "retry" => [
          'options' => [
            'active' => false,
            'factor' => 2,
            'maxDelay' => 2000,
            'minDelay' => 50,
            'retries' => 2,
            'statuses' => [
              408,
              425,
              429,
              500,
              502,
              503,
              504,
            ],
          ],
          'optspec' => [
            'jitter' => '`$BOOLEAN`',
            'sleep' => '`$FUNCTION`',
          ],
          'strict' => false,
          'transport' => 'wrap',
        ],
                "test" => [
          'options' => [
            'active' => false,
          ],
          'optspec' => [
            'entity' => '`$MAP`',
            'net' => '`$MAP`',
          ],
          'strict' => false,
          'transport' => 'base',
        ],
                "timeout" => [
          'options' => [
            'active' => false,
            'ms' => 30000,
          ],
          'optspec' => [
            'clearTimer' => '`$FUNCTION`',
            'now' => '`$FUNCTION`',
            'setTimer' => '`$FUNCTION`',
          ],
          'strict' => false,
          'transport' => 'wrap',
        ],
            ],
            "options" => [
                "base" => "https://yesnooracle.app",
                "headers" => [
          'content-type' => 'application/json',
        ],
                "entity" => [
                    "oracle" => [],
                ],
            ],
            "entity" => [
        'oracle' => [
          'fields' => [
            [
              'name' => 'answer',
              'title' => 'Answer',
              'type' => '`$STRING`',
              'req' => true,
              'short' => 'Normalized answer.',
            ],
            [
              'name' => 'forced',
              'title' => 'Forced',
              'type' => '`$BOOLEAN`',
              'req' => true,
              'short' => 'True when the verdict was set with the force parameter.',
            ],
            [
              'name' => 'image',
              'title' => 'Image',
              'type' => '`$STRING`',
              'req' => true,
              'short' => 'URL of the tool\'s artwork.',
            ],
            [
              'name' => 'phrase',
              'title' => 'Phrase',
              'type' => '`$STRING`',
              'req' => true,
              'short' => 'Themed reflective sentence.',
            ],
            [
              'name' => 'tool',
              'title' => 'Tool',
              'type' => '`$STRING`',
              'req' => true,
              'short' => 'The tool that answered.',
            ],
            [
              'name' => 'verdict',
              'title' => 'Verdict',
              'type' => '`$STRING`',
              'req' => true,
              'short' => 'Verdict label: \'yes\' or \'no\' matching answer, or \'again\' when answer is \'maybe\'.',
            ],
            [
              'name' => 'word',
              'title' => 'Word',
              'type' => '`$STRING`',
              'req' => true,
              'short' => 'Themed headline, e.g.',
            ],
          ],
          'name' => 'oracle',
          'op' => [
            'load' => [
              'input' => 'data',
              'name' => 'load',
              'points' => [
                [
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/api/oracle',
                  'segments' => [
                    [
                      'lit' => 'api',
                    ],
                    [
                      'lit' => 'oracle',
                    ],
                  ],
                  'parts' => [
                    'api',
                    'oracle',
                  ],
                  'rename' => [],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'args' => [
                    'query' => [
                      [
                        'name' => 'force',
                        'orig' => 'force',
                        'type' => '`$STRING`',
                        'kind' => 'query',
                        'example' => 'yes',
                      ],
                      [
                        'name' => 'tool',
                        'orig' => 'tool',
                        'type' => '`$STRING`',
                        'kind' => 'query',
                        'example' => 'tarot',
                        'field' => true,
                      ],
                    ],
                  ],
                  'select' => [],
                  'response' => [
                    'kind' => 'json',
                    'media' => 'application/json',
                  ],
                ],
              ],
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
      ],
        ];
    }


    public static function make_feature(string $name)
    {
        require_once __DIR__ . '/features.php';
        return YesOrNoFeatures::make_feature($name);
    }
}
