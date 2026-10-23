<?php
declare(strict_types=1);

// YesOrNo SDK exists test

require_once __DIR__ . '/../yesorno_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = YesOrNoSDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}
