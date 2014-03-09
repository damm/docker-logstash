#!/bin/sh
cd /opt/logstash/server/etc
cat logstash.conf.in | sed s/ES_PORT_9200_TCP_ADDR/${ES_PORT_9200_TCP_ADDR}/g | sed s/ES_PORT_9200_TCP_PORT/${ES_PORT_9200_TCP_PORT}/g | sed s/REDIS_PORT_6379_TCP_ADDR/${REDIS_PORT_6379_TCP_ADDR}/g | sed s/REDIS_PORT_6379_TCP_PORT/${REDIS_PORT_6379_TCP_PORT}/g > logstash.conf
java -server -Xms1024M -Xmx1024M -Djava.io.tmpdir=/tmp/ -XX:+UseParallelOldGC -jar /opt/logstash/server/lib/logstash-1.3.3-flatjar.jar agent -f /opt/logstash/server/etc/logstash.conf -v
