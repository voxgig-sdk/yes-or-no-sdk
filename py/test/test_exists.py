# YesOrNo SDK exists test

import pytest
from yesorno_sdk import YesOrNoSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = YesOrNoSDK.test(None, None)
        assert testsdk is not None
