#!/bin/bash

set -exu

: ${PSQL_1}
: ${PSQL_2}

psql "${PSQL_1}" -f scripts/db_1_schema.sql
psql "${PSQL_2}" -f scripts/db_2_schema.sql
