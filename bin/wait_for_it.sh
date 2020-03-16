#!/bin/bash

# NOTE: not sure if this is working as expected

while ! nc -ztv 127.0.0.1 8083; do
    echo "connect not ready, waiting 1 sec..."
    sleep 1
done
echo "connect ready!"

while ! psql $PSQL_1 -c "select 1" >/dev/null 2>&1; do
    echo "db-1 not ready, waiting 1 sec..."
    sleep 1
done
echo "db-1 ready!"

while ! psql $PSQL_2 -c "select 1" >/dev/null 2>&1; do
    echo "db-2 not ready, waiting 1 sec..."
    sleep 1
done
echo "db-2 ready!"

sleep 1
