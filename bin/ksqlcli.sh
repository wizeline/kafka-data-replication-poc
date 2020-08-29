#!/bin/bash

set -eu

docker run \
    --rm -ti \
    --network kafka-data-replication-poc_default \
    confluentinc/cp-ksql-cli:5.4.2 \
    http://ksql-server:8088
