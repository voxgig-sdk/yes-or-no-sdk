# YesOrNo SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/ratelimit_feature'
require_relative 'feature/retry_feature'
require_relative 'feature/test_feature'
require_relative 'feature/timeout_feature'


module YesOrNoFeatures
  def self.make_feature(name)
    case name
    when "base"
      YesOrNoBaseFeature.new
    when "ratelimit"
      YesOrNoRatelimitFeature.new
    when "retry"
      YesOrNoRetryFeature.new
    when "test"
      YesOrNoTestFeature.new
    when "timeout"
      YesOrNoTimeoutFeature.new
    else
      YesOrNoBaseFeature.new
    end
  end
end
