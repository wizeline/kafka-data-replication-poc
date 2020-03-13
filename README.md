# kafka-data-replication-poc

![poc-arch](docs/kafka.jpg)

## Plan

1. create a repo for the PoC
2. create the docker-compose file to spin up all the components
3. create the DBs schemas
4. create some script to populate the table dbs
5. configure the DB to kafka connector
6. configure the subscribers to write to DB
7. configure the subscirber to write to parquet
8. evaluate solution and document findings

## Steps to follow (PoC considering Java as programming language)

- Download Postgres connector for Java (Check this since it is a connector for Java JDBC: https://www.confluent.io/hub/confluentinc/kafka-connect-jdbc)
- Configure JDBC Source Connector (see: https://www.confluent.io/blog/kafka-connect-deep-dive-jdbc-source-connector/)
- Configure Data Source properties (see step 4 in: https://www.tutorialkart.com/apache-kafka/kafka-connector-mysql-jdbc/)
- Start Zookeeper server (up with docker compose)
- Start Kafka server (up with docker compose)
- Start source connector (see step 6 in: https://www.tutorialkart.com/apache-kafka/kafka-connector-mysql-jdbc/)
- As a example you can see how to start a console consumer (see step 7 in: https://www.tutorialkart.com/apache-kafka/kafka-connector-mysql-jdbc/)
- Configure the consumer reading from the database (see: https://www.oreilly.com/library/view/kafka-the-definitive/9781491936153/ch04.html)

``` 
NOTE: Consider using brokers for a more complete example: https://www.tutorialspoint.com/apache_kafka/apache_kafka_cluster_architecture.htm
``` 
## References

https://github.com/simplesteph/kafka-stack-docker-compose
https://github.com/wurstmeister/kafka-docker
https://github.com/wurstmeister/zookeeper-docker