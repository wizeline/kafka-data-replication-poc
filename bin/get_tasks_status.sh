#!/bin/bash

set -exu

curl \
    -H "Accept:application/json" \
    http://localhost:8083/connectors/postgres-source/tasks/0/status | jq .

curl \
    -H "Accept:application/json" \
    http://localhost:8083/connectors/postgres-sink/tasks/0/status | jq .
