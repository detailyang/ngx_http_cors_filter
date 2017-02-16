# move to [nginx-lover/ngx_http_cors_filter](https://github.com/x-v8/ngx_http_cors_filter)
# ngx_http_cors_filter
![Branch master](https://img.shields.io/badge/branch-master-brightgreen.svg?style=flat-square)[![Build](https://api.travis-ci.org/detailyang/ngx_http_cors_filter.svg)](https://travis-ci.org/detailyang/ngx_http_cors_filter)[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/detailyang/ngx_http_cors_filter/master/LICENSE)[![release](https://img.shields.io/github/release/detailyang/ngx_http_cors_filter.svg)](https://github.com/detailyang/ngx_http_cors_filter/releases)


ngx_http_cors_filter_module is a an addon for nginx to dynamic generate cors(Cross-Origin Resource Sharing). Also we can use if to get the the same purpose as following:

```
    server {
        location / {
            if ($http_origin ~ '//(.*?\.example\.com|example\.com)$') {
                add_header 'Access-Control-Allow-Origin' "$http_origin";
                add_header 'Access-Control-Allow-Credentials' 'true';
            }
            proxy_pass xx;
        }
    }
```

But you know if is evil and add_header should be in location when it is in if context:(. So use cors, just do this as following:

```
http {
    cors //(.*?\.example\.com|example\.com)$;
}

or 
http {
    cors //example\.com$;
    cors //.*?\.example\.com$;
}
```


Table of Contents
-----------------
* [How-To-Use](#how-to-use)
* [Requirements](#requirements)
* [Direction](#direction)
* [Contributing](#contributing)
* [Author](#author)
* [License](#license)


How-To-Use
----------------

ngx_http_cors_filter_module add all the response header [CORS](https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS) header.
For example:

```bash
http {
    cors //\.cors.com$;
    cors //.*\.cors.com$;
}
```

Requirements
------------

ngx_http_cors_filter requires the following to run:

 * [nginx](http://nginx.org/) or other forked version like [openresty](http://openresty.org/)、[tengine](http://tengine.taobao.org/)

Direction
------------

* cors: cors codition       
Syntax:     cors regex       
Default:    -        
Context:    main|server|location       

```
http {
    cors //\.cors.com$;
    cors //.*\.cors.com$;
}
```

* cors_force: force coover reseponse header even if it have already [CORS](https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS) header       
Syntax:     cors_force on|off      
Default:    on           
Context:    main|server|location       

```
http {
    cors_force on;
    cors //\.cors.com$;
    cors //.*\.cors.com$;
}
```

Contributing
------------

To contribute to ngx_http_cors_filter, clone this repo locally and commit your code on a separate branch.


Author
------

> GitHub [@detailyang](https://github.com/detailyang)


License
-------
ngx_http_cors_filter is licensed under the [MIT] license.

[MIT]: https://github.com/detailyang/ybw/blob/master/licenses/MIT
