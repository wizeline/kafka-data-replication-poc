#!/bin/bash

set -eu

sql_input=$(cat)

echo "$sql_input" | docker run \
    --rm -i \
    --network kafka-data-replication-poc_default \
    confluentinc/cp-ksql-cli:5.4.2 \
    http://ksql-server:8088
