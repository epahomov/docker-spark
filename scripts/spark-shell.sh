#!/usr/bin/env bash
export SPARK_LOCAL_IP=`awk 'NR==1 {print $1}' /etc/hosts`
cd /usr/local/spark
./bin/spark-shell \
	--master spark://${SPARK_MASTER_PORT_7077_TCP_ADDR}:${SPARK_MASTER_ENV_SPARK_MASTER_PORT}  \
	--conf spark.driver.host=${SPARK_LOCAL_IP} \
	--properties-file /spark-defaults.conf \
	"$@" 
