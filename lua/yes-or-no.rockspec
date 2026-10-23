package = "voxgig-sdk-yes-or-no-sdk"
version = "0.0.1-1"
source = {
  -- git+https (GitHub dropped git:// in 2022); pin the install to the release
  -- tag pushed by `make publish`, and point at the lua/ subdir of the monorepo.
  url = "git+https://github.com/voxgig-sdk/yes-or-no-sdk.git",
  tag = "lua/v0.0.1",
  dir = "yes-or-no-sdk/lua"
}
description = {
  summary = "Unofficial generated Lua SDK for the Yes or No public API. Not affiliated with or endorsed by the upstream API provider.",
  homepage = "https://github.com/voxgig-sdk/yes-or-no-sdk",
  issues_url = "https://github.com/voxgig-sdk/yes-or-no-sdk/issues",
  license = "MIT",
  labels = { "voxgig", "sdk", "generated-sdk", "openapi", "api-client", "yes-or-no" }
}
dependencies = {
  "lua >= 5.3",
  "dkjson >= 2.5",
}
build = {
  type = "builtin",
  modules = {
    ["yes-or-no_sdk"] = "yes-or-no_sdk.lua",
    ["config"] = "config.lua",
    ["config_shared"] = "config_shared.lua",
    ["config_plugins"] = "config_plugins.lua",
    ["schema"] = "schema.lua",
    ["features"] = "features.lua",
    ["feature.base_feature"] = "feature/base_feature.lua",
    ["feature.ratelimit_feature"] = "feature/ratelimit_feature.lua",
    ["feature.retry_feature"] = "feature/retry_feature.lua",
    ["feature.test_feature"] = "feature/test_feature.lua",
    ["feature.timeout_feature"] = "feature/timeout_feature.lua",
  }
}
