-- DROP SCHEMA IF EXISTS myschema;

-- CREATE SCHEMA myschema;

-- DROP TABLE IF EXISTS products;

-- CREATE TABLE products (
--   id integer PRIMARY KEY,
--   name varchar (30) NOT NULL,
--   slogan varchar (150),
--   description varchar (500),
--   category varchar (30),
--   default_price money
-- );

-- \COPY products FROM '/Users/j/Downloads/product (1).csv' DELIMITER ',' CSV HEADER;

-- DROP TABLE IF EXISTS features;

-- CREATE TABLE features (
--   id integer PRIMARY KEY,
--   product_id integer,
--   feature varchar(30),
--   value varchar(30)
-- );

-- \COPY features FROM '/Users/j/Downloads/features (1).csv' DELIMITER ',' CSV HEADER;
