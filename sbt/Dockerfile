FROM java:openjdk-7-jdk
MAINTAINER cnicolau@travelrepublic.co.uk

ENV SCALA_VERSION 2.11.7

RUN apt-get update && apt-get install -y apt-transport-https
RUN apt-get install -y apt-utils


# Install Scala
RUN \
  cd /root && \
  curl -o scala-$SCALA_VERSION.tgz http://downloads.typesafe.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.tgz && \
  tar -xf scala-$SCALA_VERSION.tgz && \
  rm scala-$SCALA_VERSION.tgz && \
  echo >> /root/.bashrc && \
  echo 'export PATH=~/scala-$SCALA_VERSION/bin:$PATH' >> /root/.bashrc

RUN \
	echo "deb https://dl.bintray.com/sbt/debian /" >> /etc/apt/sources.list.d/sbt.list  && \
	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823  && \
	apt-get update  && \
	apt-get install -y sbt

# We have to do this otherwise sbt gets redownloaded everytime we start a new container
# This starts sbt, downloads all the missing parts (it does this the first time it's started, after install), then exits the process  
RUN sbt exit


# Define working directory (this is where sbt runs - project has to be placed here)
WORKDIR /source

VOLUME ["/source"]
