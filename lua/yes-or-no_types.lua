-- Typed models for the YesOrNo SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
-- params (op.<name>.points[].g.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class Oracle
---@field answer string
---@field forced boolean
---@field image string
---@field phrase string
---@field tool string
---@field verdict string
---@field word string

---@class OracleLoadMatch
---@field force? string
---@field tool? string

local M = {}

return M
