#!/bin/bash

set -exu

curl -i -X POST \
    -H "Accept:application/json" \
    -H "Content-Type: application/json" \
    --data @config/postgres-source.json http://localhost:8083/connectors

sleep 2

curl \
    -H "Accept:application/json" \
    http://localhost:8083/connectors/postgres-source | jq .

echo "connectors:"

curl -i \
    -H "Accept:application/json" \
    http://localhost:8083/connectors/

echo "kafka-topics:"

curl \
    -H "Accept:application/json" \
    "http://localhost:8082/topics" | jq .
