SHOW TOPICS;

CREATE STREAM table_a_src (id INTEGER, column_a VARCHAR (50), column_b VARCHAR (50), created_on bigint)
WITH (KAFKA_TOPIC='pgsql-1.public.table_a', VALUE_FORMAT='AVRO');

CREATE STREAM table_a_src_rekey WITH (PARTITIONS=1) AS
SELECT * FROM table_a_src PARTITION BY id;

SHOW STREAMS;

CREATE TABLE table_a (id INTEGER, column_a VARCHAR (50), column_b VARCHAR (50), created_on bigint)
WITH (KAFKA_TOPIC='TABLE_A_SRC_REKEY', VALUE_FORMAT='AVRO', KEY='id');

SHOW TABLES;
