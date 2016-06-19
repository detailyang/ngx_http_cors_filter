use Test::Nginx::Socket 'no_plan';

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

=== TEST 3: cors http ctx regex should be ok
--- http_config
cors //abcd\.com$;

--- config
location = / {
    root html;
    index index.html index.htm;
}

--- more_headers
Origin: http://abcd.com

--- request
GET /

--- response_headers
Access-Control-Allow-Credentials: true
Access-Control-Allow-Origin: http://abcd.com

=== TEST 4: cors http ctx regex should be ok
--- http_config
cors //abcd\.com$;

--- config
location = / {
    root html;
    index index.html index.htm;
}

--- more_headers
Origin: https://abcd.com

--- request
GET /

--- response_headers
Access-Control-Allow-Credentials: true
Access-Control-Allow-Origin: https://abcd.com