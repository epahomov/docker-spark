FROM ubuntu:14.04

MAINTAINER Pakhomov Egor <pahomov.egor@gmail.com>

RUN apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes software-properties-common python-software-properties
RUN apt-add-repository -y ppa:webupd8team/java
RUN apt-get -y update
RUN /bin/echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install oracle-java7-installer oracle-java7-set-default
RUN curl -s http://d3kbcqa49mib13.cloudfront.net/spark-1.2.1-bin-hadoop2.4.tgz | tar -xz -C /usr/local/
RUN cd /usr/local && ln -s spark-1.2.1-bin-hadoop2.4 spark
ENV SPARK_HOME /usr/local/spark

EXPOSE 8080 7077 8888 8081
