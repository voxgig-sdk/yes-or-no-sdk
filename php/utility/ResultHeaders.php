<?php
declare(strict_types=1);

// YesOrNo SDK utility: result_headers

class YesOrNoResultHeaders
{
    public static function call(YesOrNoContext $ctx): ?YesOrNoResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
