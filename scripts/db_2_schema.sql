DROP TABLE IF EXISTS table_b;

CREATE TABLE IF NOT EXISTS table_b (
   id serial PRIMARY KEY,
   column_c VARCHAR (50) NOT NULL,
   column_a VARCHAR (50) NOT NULL,
   created_on TIMESTAMP NOT NULL
);

\dt;
\d table_b;