# YesOrNo SDK utility: make_context

from yesorno_sdk.core.context import YesOrNoContext


def make_context_util(ctxmap, basectx):
    return YesOrNoContext(ctxmap, basectx)
