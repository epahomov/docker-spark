FROM alpine:3.4

MAINTAINER Pakhomov Egor <pahomov.egor@gmail.com>
LABEL version="lightweighted_java_8_spark_2.1.0_hadoop_2.7"

RUN apk --update add openjdk8-jre && \
    apk add --update bash && \
    apk add --update python && \
    rm -rf /var/cache/apk/* && \
    wget http://d3kbcqa49mib13.cloudfront.net/spark-2.1.0-bin-hadoop2.7.tgz && \
    tar -xf spark-2.1.0-bin-hadoop2.7.tgz && \
    ln -s /spark-2.1.0-bin-hadoop2.7 /spark

CMD ["/spark/bin/spark-shell"]