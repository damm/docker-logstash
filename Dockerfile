FROM damm/java
MAINTAINER <scott@likens.us>
RUN apt-get update && apt-get install wget -y
ENV VERSION 1.4.2
RUN wget https://download.elasticsearch.org/logstash/logstash/logstash-${VERSION}.tar.gz -O /var/tmp/logstash-${VERSION}.tar.gz
RUN cd /opt;tar zxf /var/tmp/logstash-${VERSION}.tar.gz && mv /opt/logstash-${VERSION} /opt/logstash
RUN ls /opt
RUN ls /opt/logstash
RUN mkdir -p /opt/logstash/{etc,tmp,log}
ADD logstash.conf.in /opt/logstash/etc/logstash.conf.in
ADD GeoLiteCity.dat /opt/logstash/lib/GeoLiteCity.dat
ADD patterns/exim /opt/logstash/patterns/exim
ADD run.sh /run.sh
EXPOSE 514/udp
EXPOSE 514
ENTRYPOINT /run.sh
