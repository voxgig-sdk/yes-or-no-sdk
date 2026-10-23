# frozen_string_literal: true

# Typed models for the YesOrNo SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
# params (op.<name>.points[].g.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Oracle entity data model.
#
# @!attribute [rw] answer
#   @return [String]
#
# @!attribute [rw] forced
#   @return [Boolean]
#
# @!attribute [rw] image
#   @return [String]
#
# @!attribute [rw] phrase
#   @return [String]
#
# @!attribute [rw] tool
#   @return [String]
#
# @!attribute [rw] verdict
#   @return [String]
#
# @!attribute [rw] word
#   @return [String]
Oracle = Struct.new(
  :answer,
  :forced,
  :image,
  :phrase,
  :tool,
  :verdict,
  :word,
  keyword_init: true
)

# Request payload for Oracle#load.
#
# @!attribute [rw] force
#   @return [String, nil]
#
# @!attribute [rw] tool
#   @return [String, nil]
OracleLoadMatch = Struct.new(
  :force,
  :tool,
  keyword_init: true
)

