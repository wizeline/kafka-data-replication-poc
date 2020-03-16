#!/bin/bash

set -exu

function restart_sink() {
    curl -i -X POST \
        -H "Accept:application/json" \
        -H "Content-Type: application/json" \
        http://localhost:8083/connectors/postgres-sink/restart

    curl http://localhost:8083/connectors/postgres-sink/tasks/0/status | jq .
}

function restart_source() {
    curl -i -X POST \
        -H "Accept:application/json" \
        -H "Content-Type: application/json" \
        http://localhost:8083/connectors/postgres-source/restart

    curl http://localhost:8083/connectors/postgres-source/tasks/0/status | jq .
}

case $1 in
sink)
    restart_sink
    ;;

source)
    restart_source
    ;;
*)
    echo "no task specified"
    exit 1
    ;;
esac
