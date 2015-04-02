#!/usr/bin/env bash
/remove_alias.sh
export SPARK_MASTER_IP=0.0.0.0
export SPARK_LOCAL_IP=0.0.0.0
/usr/local/spark/sbin/start-master.sh --properties-file /spark-defaults.conf -i $SPARK_LOCAL_IP
/bin/bash
