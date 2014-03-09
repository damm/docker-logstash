FROM damm/java
MAINTAINER <scott@likens.us>
RUN mkdir -p /opt/logstash/server/{lib,etc,log,tmp,bin}
ADD https://download.elasticsearch.org/logstash/logstash/logstash-1.3.3-flatjar.jar /opt/logstash/server/lib/logstash-1.3.3-flatjar.jar
ADD logstash.conf.in /opt/logstash/server/etc/logstash.conf.in
ADD GeoLiteCity.dat /opt/logstash/server/GeoLiteCity.dat
ADD run.sh /run.sh
EXPOSE 514/udp
EXPOSE 514
ENTRYPOINT /run.sh
