#!/usr/bin/env bash
docker pull meyerson/docker-spark
docker run -d -t -P --link spark_master:spark_master meyerson/docker-spark /start-worker.sh "$@"
