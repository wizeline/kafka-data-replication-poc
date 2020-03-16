#!/bin/bash

set -exu

curl -i -X POST \
    -H "Accept:application/json" \
    -H "Content-Type: application/json" \
    --data @config/postgres-sink.json http://localhost:8083/connectors

curl \
    -H "Accept:application/json" \
    http://localhost:8083/connectors/postgres-sink | jq .

echo "connectors:"

curl -i \
    -H "Accept:application/json" \
    http://localhost:8083/connectors/
