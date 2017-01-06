Spark client docker image
=========================

[![DockerPulls](https://img.shields.io/docker/pulls/epahomov/docker-spark.svg)](https://registry.hub.docker.com/u/epahomov/docker-spark)
[![DockerStars](https://img.shields.io/docker/stars/epahomov/docker-spark.svg)](https://registry.hub.docker.com/u/epahomov/docker-spark)

This repository contains a [docker](https://www.docker.io/) image to run [Apache Spark](https://spark.apache.org/) client.

To run simple spark [shell](http://spark.apache.org/docs/latest/quick-start.html#basics) :

```
docker run -it epahomov/docker-spark:lightweighted /spark/bin/spark-shell
```

To run simple python spark [shell](http://spark.apache.org/docs/latest/quick-start.html#basics) (known as pyspark) :

```
docker run -it epahomov/docker-spark:lightweighted /spark/bin/pyspark
```

Examples before used lightweighted version of this image. It's very small, so it would download very fast, but it's not very flexible. All next examples would be with default version 

To run simple spark [R shell](http://spark.apache.org/docs/latest/sparkr.html) :

```
docker run -it epahomov/docker-spark /spark/bin/sparkR
```

To run simple spark [sql shell](http://spark.apache.org/docs/latest/sql-programming-guide.html) :

```
docker run -it epahomov/docker-spark /spark/bin/spark-sql
```

To run simple spark shell with some changed properties like [here](http://spark.apache.org/docs/latest/programming-guide.html#using-the-shell) :

```
docker run -it epahomov/docker-spark /spark/bin/spark-shell  --master local[4]
```

To run simple spark shell with changed spark-defaults.conf do:

```
printf "spark.master local[4] \nspark.executor.cores 4" > spark-defaults.conf
sudo docker run -v $(pwd)/spark-defaults.conf:/spark/conf/spark-defaults.conf -it epahomov/docker-spark /spark/bin/spark-shell
```
First line write conf into file spark-defaults.conf, and second line mount this file from host file system to filesystem in container and puts it in conf directory.

To be able to use spark ui, add " -p 4040:4040 " argument:

```
docker run -ti -p 4040:4040 epahomov/docker-spark /spark/bin/spark-shell
```

To run some python script do:

```
echo "import pyspark\nprint(pyspark.SparkContext().parallelize(range(0, 10)).count())" > count.py
docker run -it -p 4040:4040 -v $(pwd)/count.py:/count.py epahomov/docker-spark /spark/bin/spark-submit /count.py
```

## Hadoop

With this image you can connect to Hadoop cluster from spark. All you need is specify HADOOP_CONF_DIR and pass directory with hadoop configs as volume

```
docker run -v $(pwd)/hadoop:/etc/hadoop/conf -e "HADOOP_CONF_DIR=/etc/hadoop/conf" --net=host  -it epahomov/docker-spark /spark/bin/spark-shell --master yarn-client
```

## Versions

This container exists in next versions:

* spark_2.0_hadoop_2.7
* spark_2.0_hadoop_2.6
* spark_2.1_hadoop_2.7
* spark_2.1_hadoop_2.6
* lightweighted - lightweighted version of this image. It's based on alpine linux and downloaded binary, not build from source with all possible plags(like -Pyarn).
* old-spark - Old functionality with setting up spark cluster. Not supported, not recommended to use.

Master has version spark_2.1_hadoop_2.7

## Zeppelin

This image is base image for [Apache Zeppelin Image](https://github.com/epahomov/docker-zeppelin)