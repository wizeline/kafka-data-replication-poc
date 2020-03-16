# kafka-data-replication-poc

![poc-arch](docs/kafka.jpg)
Image 2: Architecture

![poc-arch-2](docs/kafka.png)
Image 2: Data Flows

## Plan

1. create a repo for the PoC
2. create the docker-compose file to spin up all the components
3. create the DBs schemas
4. create some script to populate the table dbs
5. configure the DB to kafka connector
6. configure the subscribers to write to DB
7. configure the subscriber to write to parquet
8. evaluate solution and document findings

## Steps to follow (PoC considering Java as programming language)

1. Download Postgres connector for Java (Check this since it is a connector for Java JDBC: https://www.confluent.io/hub/confluentinc/kafka-connect-jdbc)
2. Configure JDBC Source Connector (see: https://www.confluent.io/blog/kafka-connect-deep-dive-jdbc-source-connector/)
3. Configure Data Source properties (see step 4 in: https://www.tutorialkart.com/apache-kafka/kafka-connector-mysql-jdbc/)
4. Run the PoC. See next section
5. Start source connector (see step 6 in: https://www.tutorialkart.com/apache-kafka/kafka-connector-mysql-jdbc/)
6. As a example you can see how to start a console consumer (see step 7 in: https://www.tutorialkart.com/apache-kafka/kafka-connector-mysql-jdbc/)
7. Configure the consumer reading from the database (see: https://www.oreilly.com/library/view/kafka-the-definitive/9781491936153/ch04.html)

```txt
NOTE: Consider using brokers for a more complete example: https://www.tutorialspoint.com/apache_kafka/apache_kafka_cluster_architecture.htm
```

## Running the PoC

1. prepare the environment `source bin/env`
2. build the container images `make build`
3. start the applications `make run`. NOTE: you may have to wait at least 30 seconds.
4. prepare the database `make initialize-dbs`
5. inject some data to the database:

```shell
PSQL_URL=$PSQL_1 python scripts/inser_new_rows.py 20
```

6. configure the kafka cluster:

```shell
bash bin/config_kafka.sh
cat config/ksql_config.sql| bin/ksqlcli_pipe.sh
```

7. list existing kafka resources:

```shell
cat scripts/show_kafka_resources.sql|bin/ksqlcli_pipe.sh
```

8. create source topics and tables:

```shell
cat scripts/create_source_tables.sql|bin/ksqlcli_pipe.sh
```

9. list existing kafka resources and compare against results of step 7:

```shell
cat scripts/show_kafka_resources.sql|bin/ksqlcli_pipe.sh
```

9. config kafka sink table

```shell
bash bin/config_kafka_sink_table.sh
```

## References

- https://github.com/simplesteph/kafka-stack-docker-compose
- https://github.com/wurstmeister/kafka-docker
- https://github.com/wurstmeister/zookeeper-docker
- https://github.com/confluentinc/cp-docker-images
- https://github.com/authorjapps/zerocode-docker-factory/blob/master/compose/kafka-schema-registry.yml
- https://highalpha.com/data-stream-processing-for-newbies-with-kafka-ksql-and-postgres/
- https://github.com/mtpatter/postgres-kafka-demo
- https://debezium.io/documentation/reference/1.0/architecture.html
