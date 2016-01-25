### Build status

[![Build Status](https://travis-ci.org/damm/docker-logstash.png)](https://travis-ci.org/damm/docker-logstash)

Logstash
=========

This image is one way to deploy Logstash using [Docker][docker].  It uses [damm/java8][dammjava8] to provide Java.

Requirements
=============

> You can always use your own Redis and Elasticsearch image; I just use these as an example.

* [Elasticsearch][dammelasticsearch]
* [Redis][dammredis]

Usage
======

+ Start Redis
```shell
docker run -d -name redis damm/redis
```

+ Start Elasticsearch

```shell
docker run -d -name elasticsearch -p 9200:9200 -v /data/elasticsearch/shared:/data/elasticsearch/shared damm/elasticsearch
```

+ Start Logstash

```shell
docker run -d -name logstash -p 514:514/tcp -p 514:514/udp -link redis:redis -link elasticsearch:es damm/logstash
```

[docker]: http://www.docker.io
[dammjava8]: http://github.com/damm/docker-java8
[dammelasticsearch]: http://github.com/damm/docker-elasticsearch
[dammredis]: http://github.com/damm/damm-redis

License and Author
-------------------

The MIT License (MIT)

Copyright (c) 2014, Scott M. Likens

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
