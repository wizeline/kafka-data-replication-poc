ARG BASE_VERSION=1.3
FROM debezium/connect:${BASE_VERSION}

ENV KAFKA_CONNECT_JDBC_DIR=$KAFKA_CONNECT_PLUGINS_DIR/kafka-connect-jdbc \
    KAFKA_CONNECT_ES_DIR=$KAFKA_CONNECT_PLUGINS_DIR/kafka-connect-elasticsearch

# Deploy PostgreSQL JDBC Driver
RUN cd /kafka/libs && curl -sO https://jdbc.postgresql.org/download/postgresql-42.1.4.jar

ARG KAFKA_CONNECT_JDBC_VERSION=5.4.2
# Deploy Kafka Connect JDBC
RUN mkdir $KAFKA_CONNECT_JDBC_DIR && cd $KAFKA_CONNECT_JDBC_DIR &&\
    curl -sO http://packages.confluent.io/maven/io/confluent/kafka-connect-jdbc/${KAFKA_CONNECT_JDBC_VERSION}/kafka-connect-jdbc-${KAFKA_CONNECT_JDBC_VERSION}.jar
