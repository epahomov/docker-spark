#!/usr/bin/env bash
docker pull epahomov/docker-spark
run -i -t -P --link spark_master:spark_master epahomov/docker-spark /spark-shell.sh
