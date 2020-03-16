#!/bin/bash

set -eu

docker run \
    --rm -ti \
    --network kafka-data-replication-poc_default \
    confluentinc/cp-ksql-cli:latest \
    http://ksql-server:8088
