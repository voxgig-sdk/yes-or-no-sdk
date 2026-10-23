# YesOrNo SDK exists test

require "minitest/autorun"
require_relative "../YesOrNo_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = YesOrNoSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
