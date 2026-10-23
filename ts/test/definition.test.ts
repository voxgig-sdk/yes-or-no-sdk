import { describe, test } from 'node:test'
import { SDK } from '..'
import { runDefinitionPoint } from './definition-runner'
import { isControlSkipped } from './utility'


// Generated from the API definition, not from the model this SDK was built
// from: the route, the declared query parameters, the credential the security
// scheme names, and the definition's own response example.
const PLAN: any[] = [
  {
    "entity": "oracle",
    "accessor": "Oracle",
    "op": "load",
    "method": "GET",
    "path": "/api/oracle",
    "args": [],
    "select": {
      "force": "yes",
      "tool": "tarot"
    },
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [
      "tool",
      "force"
    ],
    "queryArgs": [
      {
        "name": "force",
        "wire": "force"
      },
      {
        "name": "tool",
        "wire": "tool"
      }
    ],
    "auth": null,
    "status": 200,
    "sample": {
      "answer": "yes",
      "verdict": "yes",
      "word": "The Emperor",
      "phrase": "The Emperor brings order and solid ground. Build on it with confidence — yes.",
      "tool": "tarot",
      "forced": true,
      "image": "https://yesnooracle.app/art-tarot.webp"
    },
    "idField": "id"
  }
]


describe('definition', () => {
  for (const point of PLAN) {
    test(point.entity + '.' + point.op + ' ' + point.method + ' ' + point.path, async (t) => {
      const control = isControlSkipped('entityOp', point.entity + '.' + point.op, 'definition')
      if (control.skip) {
        t.skip(control.reason || 'skipped via sdk-test-control.json')
        return
      }
      await runDefinitionPoint(SDK, point)
    })
  }
})
