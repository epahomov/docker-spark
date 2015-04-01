#!/usr/bin/env bash
export SPARK_MASTER_IP=`awk 'NR==1 {print $1}' /etc/hosts`
/usr/local/spark/sbin/start-master.sh
/bin/bash
