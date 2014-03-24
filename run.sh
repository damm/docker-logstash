#!/bin/sh
cd /opt/logstash/etc
 sed "s/ES_PORT_9200_TCP_ADDR/${ES_PORT_9200_TCP_ADDR}/g;
 s/ES_PORT_9200_TCP_PORT/${ES_PORT_9200_TCP_PORT}/g;
 s/REDIS_PORT_6379_TCP_ADDR/${REDIS_PORT_6379_TCP_ADDR}/g;
 s/REDIS_PORT_6379_TCP_PORT/${REDIS_PORT_6379_TCP_PORT}/g" logstash.conf.in > logstash.conf
cd /opt/logstash
bin/logstash -f etc/logstash.conf
