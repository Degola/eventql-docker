FROM ubuntu
MAINTAINER Sebastian Lagemann <docker@degola.de>
LABEL Description='This image creates an eventql-0.4.0-rc0 image' Version='0.4.0-rc0'
WORKDIR /opt/eventql

RUN apt-get update && apt-get install -y wget
RUN wget --content-disposition http://dl.eventql.io/eventql/v0.4.0-rc0/eventql-0.4.0-rc0-linux_x86_64.tgz
RUN apt-get purge -y wget
RUN tar -xzvf eventql*.tgz
RUN ls -lisa
RUN rm eventql-*.tgz
EXPOSE 9175
VOLUME /var/lib/eventql
COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
