use Test::Nginx::Socket 'no_plan';

repeat_each(100);
# plan tests => repeat_each() * (3 * blocks());
no_shuffle();
run_tests();

__DATA__
=== TEST 1: cors http ctx should be ok
--- http_config
cors .*;

--- config
location = / {
    root html;
    index index.html index.htm;
}

--- more_headers
Origin: abcd

--- request
GET /

--- response_headers
Access-Control-Allow-Credentials: true
Access-Control-Allow-Origin: abcd

=== TEST 2: cors location ctx should be ok
--- config
location = /abcd {
    cors .*;
    root html;
    index index.html index.htm;
}

--- more_headers
Origin: abcd

--- request
GET /abcd

--- response_headers
Access-Control-Allow-Credentials: true
Access-Control-Allow-Origin: abcd

--- error_code: 404
