# YesOrNo SDK utility: make_context
require_relative '../core/context'
module YesOrNoUtilities
  MakeContext = ->(ctxmap, basectx) {
    YesOrNoContext.new(ctxmap, basectx)
  }
end
