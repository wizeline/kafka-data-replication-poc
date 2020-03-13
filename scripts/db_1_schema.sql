DROP TABLE IF EXISTS table_a;

CREATE TABLE IF NOT EXISTS table_a (
   id serial PRIMARY KEY,
   column_a VARCHAR (50) NOT NULL,
   column_b VARCHAR (50) NOT NULL,
   created_on TIMESTAMP NOT NULL
);

-- TODO: copy some seed data

\dt;
\d table_a;