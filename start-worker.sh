#!/usr/bin/env bash
run -d -t -P --link spark_master:spark_master epahomov/docker-spark /start-worker.sh
