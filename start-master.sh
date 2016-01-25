#!/usr/bin/env bash
docker pull meyerson/docker-spark
docker run -d -t -P --name spark_master meyerson/docker-spark /start-master.sh "$@"
