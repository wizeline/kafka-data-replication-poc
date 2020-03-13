#!/bin/bash

set -exu

psql "postgres://postgres:password@localhost:5432/database_1?sslmode=disable" -f scripts/db_1_schema.sql
psql "postgres://postgres:password@localhost:5433/database_2?sslmode=disable" -f scripts/db_2_schema.sql
