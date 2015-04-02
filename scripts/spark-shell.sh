#!/usr/bin/env bash
/remove_alias.sh
cd /usr/local/spark
export SPARK_LOCAL_IP=0.0.0.0
./bin/spark-shell --master spark://${SPARK_MASTER_PORT_7077_TCP_ADDR}:${SPARK_MASTER_ENV_SPARK_MASTER_PORT} -i ${SPARK_LOCAL_IP}
