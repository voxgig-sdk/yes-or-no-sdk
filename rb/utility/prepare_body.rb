# YesOrNo SDK utility: prepare_body
require_relative 'media'
module YesOrNoUtilities
  PrepareBody = ->(ctx) {
    return nil unless ctx.op.input == "data"
    return YesOrNoUtilities.raw_body(ctx.reqdata) if YesOrNoUtilities.raw_request?(ctx.point)
    ctx.utility.transform_request.call(ctx)
  }
end
