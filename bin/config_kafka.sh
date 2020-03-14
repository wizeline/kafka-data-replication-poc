#!/bin/bash

set -exu

curl -i -X POST \
    -H "Accept:application/json" \
    -H "Content-Type: application/json" \
    --data @config/postgres-source.json http://localhost:8083/connectors

echo "connectors:"

curl -i \
    -H "Accept:application/json" \
    http://localhost:8083/connectors/

echo "kafka-topics:"

docker-compose exec kafka bash -c '/usr/bin/kafka-topics --list --zookeeper zookeeper:2181'
