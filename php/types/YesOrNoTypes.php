<?php
declare(strict_types=1);

// Typed models for the YesOrNo SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
// params (op.<name>.points[].g.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** Oracle entity data model. */
class Oracle
{
    public string $answer;
    public bool $forced;
    public string $image;
    public string $phrase;
    public string $tool;
    public string $verdict;
    public string $word;
}

/** Request payload for Oracle#load. */
class OracleLoadMatch
{
    public ?string $force = null;
    public ?string $tool = null;
}

