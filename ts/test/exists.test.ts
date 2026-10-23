
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { YesOrNoSDK } from '..'


describe('exists', async () => {

  test('test-mode', () => {
    const testsdk = YesOrNoSDK.test()
    equal(testsdk instanceof YesOrNoSDK, true,
      'YesOrNoSDK.test() must return a client synchronously')
  })

})
