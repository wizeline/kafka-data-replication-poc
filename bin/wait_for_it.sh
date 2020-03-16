#!/bin/bash

while ! nc -z 127.0.0.1 8083; do
    echo "connect not ready, waiting 1 sec..."
    sleep 1
done
echo "connect ready!"

while ! nc -z 127.0.0.1 5432; do
    echo "db-1 not ready, waiting 1 sec..."
    sleep 1
done
echo "db-1 ready!"

while ! nc -z 127.0.0.1 5433; do
    echo "db-2 not ready, waiting 1 sec..."
    sleep 1
done
echo "db-2 ready!"

sleep 1
