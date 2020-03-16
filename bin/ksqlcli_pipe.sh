#!/bin/bash

set -eu

sql_input=$(cat)

echo "$sql_input" | docker run \
    --rm -i \
    --network kafka-data-replication-poc_default \
    confluentinc/cp-ksql-cli:latest \
    http://ksql-server:8088
