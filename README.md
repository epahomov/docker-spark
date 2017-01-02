Docker container for spark client
=================================

This repository contains a [docker](https://www.docker.io/) image to run [Apache Spark](https://spark.apache.org/) client.

To run simple spark [shell](http://spark.apache.org/docs/latest/quick-start.html#basics) :

```
docker run -it 71b848041c58 /spark/bin/spark-shell
```

To run simple python spark [shell](http://spark.apache.org/docs/latest/quick-start.html#basics) (known as pyspark) :

```
docker run -it 71b848041c58 /spark/bin/pyspark
```

To run simple spark [sql shell](http://spark.apache.org/docs/latest/quick-start.html#basics) :

```
docker run -it 71b848041c58 /spark/bin/spark-sql
```

To run simple spark shell with some changed properties like [here](http://spark.apache.org/docs/latest/programming-guide.html#using-the-shell) :

```
docker run -it 71b848041c58 /spark/bin/spark-shell  --master local[4]
```

To run simple spark shell with changed spark-defaults.conf do:

```
printf "spark.master local[4] \nspark.executor.cores 4" > spark-defaults.conf
sudo docker run -v $(pwd)/spark-defaults.conf:/spark/conf/spark-defaults.conf -it 7bd0c8c95a68 /spark/bin/spark-shell
```
First line write conf into file spark-defaults.conf, and second line mount this file from host file system to filesystem in container and puts it in conf directory.

To be able to use spark ui, add " -p 4040:4040 " argument:

```
docker run -ti -p 4040:4040 7bd0c8c95a68 /spark/bin/spark-shell
```

To run some python script do:

```
echo "import pyspark\nprint(pyspark.SparkContext().parallelize(range(0, 10)).count())" > count.py
docker run -it -p 4040:4040 -v $(pwd)/count.py:/count.py 7bd0c8c95a68 /spark/bin/spark-submit /count.py
```
