# YesOrNo SDK feature factory

from yesorno_sdk.feature.base_feature import YesOrNoBaseFeature
from yesorno_sdk.feature.ratelimit_feature import YesOrNoRatelimitFeature
from yesorno_sdk.feature.retry_feature import YesOrNoRetryFeature
from yesorno_sdk.feature.test_feature import YesOrNoTestFeature
from yesorno_sdk.feature.timeout_feature import YesOrNoTimeoutFeature


_FEATURES = {
    "base": lambda: YesOrNoBaseFeature(),
    "ratelimit": lambda: YesOrNoRatelimitFeature(),
    "retry": lambda: YesOrNoRetryFeature(),
    "test": lambda: YesOrNoTestFeature(),
    "timeout": lambda: YesOrNoTimeoutFeature(),
}


def _make_feature(name):
    factory = _FEATURES.get(name)
    if factory is not None:
        return factory()
    return _FEATURES["base"]()


# True when this SDK was generated with the named feature class - the
# constructor's tolerance for extend-carried features reads this (an
# active name with no generated class must not become a BaseFeature
# stray when an extend instance carries it).
def _has_feature(name):
    return name in _FEATURES
