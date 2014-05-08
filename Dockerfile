FROM damm/java
MAINTAINER <scott@likens.us>
RUN apt-get update && apt-get install wget -y
RUN wget https://download.elasticsearch.org/logstash/logstash/logstash-1.4.1.tar.gz -O /var/tmp/logstash-1.4.1.tar.gz
RUN cd /opt;tar zxf /var/tmp/logstash-1.4.1.tar.gz && mv /opt/logstash-1.4.1 /opt/logstash
RUN ls /opt
RUN ls /opt/logstash
RUN mkdir -p /opt/logstash/{etc,tmp,log}
ADD logstash.conf.in /opt/logstash/etc/logstash.conf.in
ADD GeoLiteCity.dat /opt/logstash/lib/GeoLiteCity.dat
ADD run.sh /run.sh
EXPOSE 514/udp
EXPOSE 514
ENTRYPOINT /run.sh
