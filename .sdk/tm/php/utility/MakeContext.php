<?php
declare(strict_types=1);

// YesOrNo SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class YesOrNoMakeContext
{
    public static function call(array $ctxmap, ?YesOrNoContext $basectx): YesOrNoContext
    {
        return new YesOrNoContext($ctxmap, $basectx);
    }
}
