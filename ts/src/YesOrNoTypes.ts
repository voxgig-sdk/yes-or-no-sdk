// Typed models for the YesOrNo SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
// params (op.<name>.points[].g.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Oracle {
  answer: string
  forced: boolean
  image: string
  phrase: string
  tool: string
  verdict: string
  word: string
}

export interface OracleLoadMatch {
  force?: string
  tool?: string
}

