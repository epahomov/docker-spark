#!/usr/bin/env bash
export SPARK_LOCAL_IP=`awk 'NR==1 {print $1}' /etc/hosts`
/remove_alias.sh
cd /usr/local/spark
./bin/spark-shell --master spark://${SPARK_MASTER_PORT_7077_TCP_ADDR}:${SPARK_MASTER_ENV_SPARK_MASTER_PORT} -i ${SPARK_LOCAL_IP}  --executor-memory 300M --total-executor-cores 3 --properties-file /spark-defaults.conf
