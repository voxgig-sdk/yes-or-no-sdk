<?php
declare(strict_types=1);

// YesOrNo SDK base feature

class YesOrNoBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    // Positions this feature when added via the client `extend` option:
    // "__before__" / "__after__" / "__replace__" name an already-added
    // feature (mirrors the ts feature `_options`). Declared so setting it
    // on an extension instance avoids the dynamic-property deprecation.
    public ?array $_options = null;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(YesOrNoContext $ctx, array $options): void {}
    public function PostConstruct(YesOrNoContext $ctx): void {}
    public function PostConstructEntity(YesOrNoContext $ctx): void {}
    public function SetData(YesOrNoContext $ctx): void {}
    public function GetData(YesOrNoContext $ctx): void {}
    public function GetMatch(YesOrNoContext $ctx): void {}
    public function SetMatch(YesOrNoContext $ctx): void {}
    public function PrePoint(YesOrNoContext $ctx): void {}
    public function PreSpec(YesOrNoContext $ctx): void {}
    public function PreRequest(YesOrNoContext $ctx): void {}
    public function PreResponse(YesOrNoContext $ctx): void {}
    public function PreResult(YesOrNoContext $ctx): void {}
    public function PreDone(YesOrNoContext $ctx): void {}
    public function PreUnexpected(YesOrNoContext $ctx): void {}
}
