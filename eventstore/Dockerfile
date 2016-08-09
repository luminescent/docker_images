FROM ubuntu:14.04
MAINTAINER luminescent

RUN apt-get update 
RUN apt-get install -y wget 
RUN apt-get install -y curl 

RUN wget https://packagecloud.io/install/repositories/EventStore/EventStore-OSS/script.deb.sh
RUN chmod +x script.deb.sh

RUN bash script.deb.sh

RUN apt-get install -y eventstore-oss

EXPOSE 1113
EXPOSE 2113

VOLUME /db
VOLUME /logs


ENTRYPOINT ["/usr/bin/eventstored", "--db", "/db", "--log", "/logs"] 
