# YesOrNo SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'graphql'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

YesOrNoUtility.registrar = ->(u) {
  u.clean = YesOrNoUtilities::Clean
  u.clean_add = YesOrNoUtilities::CleanAdd
  u.clean_explain = YesOrNoUtilities::CleanExplain
  u.done = YesOrNoUtilities::Done
  u.make_error = YesOrNoUtilities::MakeError
  u.feature_add = YesOrNoUtilities::FeatureAdd
  u.feature_hook = YesOrNoUtilities::FeatureHook
  u.feature_init = YesOrNoUtilities::FeatureInit
  u.fetcher = YesOrNoUtilities::Fetcher
  u.make_fetch_def = YesOrNoUtilities::MakeFetchDef
  u.make_context = YesOrNoUtilities::MakeContext
  u.make_options = YesOrNoUtilities::MakeOptions
  u.make_request = YesOrNoUtilities::MakeRequest
  u.make_response = YesOrNoUtilities::MakeResponse
  u.make_result = YesOrNoUtilities::MakeResult
  u.make_point = YesOrNoUtilities::MakePoint
  u.make_spec = YesOrNoUtilities::MakeSpec
  u.make_url = YesOrNoUtilities::MakeUrl
  u.param = YesOrNoUtilities::Param
  u.prepare_auth = YesOrNoUtilities::PrepareAuth
  u.prepare_body = YesOrNoUtilities::PrepareBody
  u.prepare_headers = YesOrNoUtilities::PrepareHeaders
  u.prepare_method = YesOrNoUtilities::PrepareMethod
  u.prepare_params = YesOrNoUtilities::PrepareParams
  u.prepare_path = YesOrNoUtilities::PreparePath
  u.prepare_query = YesOrNoUtilities::PrepareQuery
  u.graphql_body = YesOrNoUtilities::GraphqlBody
  u.graphql_errors = YesOrNoUtilities::GraphqlErrors
  u.result_basic = YesOrNoUtilities::ResultBasic
  u.result_body = YesOrNoUtilities::ResultBody
  u.result_headers = YesOrNoUtilities::ResultHeaders
  u.transform_request = YesOrNoUtilities::TransformRequest
  u.transform_response = YesOrNoUtilities::TransformResponse
}
