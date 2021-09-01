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

-- DROP TABLE IF EXISTS styles;
-- CREATE TABLE styles (
--   id integer PRIMARY KEY,
--   product_id integer,
--   name varchar(50),
--   sale_price varchar(10),
--   original_price money NOT NULL,
--   default_style boolean
-- );

-- \COPY styles FROM '/Users/j/Downloads/styles.csv' DELIMITER ',' CSV HEADER;

-- DROP TABLE IF EXISTS related;
-- CREATE TABLE related (
--   id integer PRIMARY KEY,
--   current_product_id integer,
--   related_product_id integer
-- );
-- \COPY related FROM '/Users/j/Downloads/related.csv' DELIMITER ',' CSV HEADER;

-- DROP TABLE IF EXISTS photos;
-- CREATE TABLE photos (
--   id integer PRIMARY KEY,
--   styleId integer,
--   url text,
--   quantity text
-- skus
-- \COPY photos FROM '/Users/j/Downloads/photos.csv' DELIMITER ',' CSV HEADER;

-- DROP TABLE IF EXISTS skus;
-- CREATE TABLE skus (
--   id integer PRIMARY KEY,
--   style_id integer,
--   size varchar(10),
--   quantity integer
-- );
-- \COPY skus FROM '/Users/j/Downloads/skus.csv' DELIMITER ',' CSV HEADER;

SELECT styleid, json_build_object(
    'url', (SELECT url from photos),
    'quantity', (SELECT thumbnail url from photos)
  ) limit 3skus

id  | product_id | name  | sale_price | original_price | default_style |                                                                                                                         skus
SELECT product_id, json_build_object(
  'style_id', id,
  'name', name,
  'original_price', original_price,
  'sale_price', sale_price,
  'default?', default_style,
  'skus'
) from styles2;

array_agg()
SELECT styleid,
  json_build_object('url', url,'quantity', quantity)
  from skus
  limit 3;

SELECT styleid, array_agg(json_build_object) 
  FROM photos3 GROUP BY styleid 
  ORDER BY styleid;

SELECT style_id,
  json_build_object('size', size,'quantity', quantity)
  from skus
  limit 3;

SELECT product_id, array_agg(json_build_object) 
  FROM styles3 GROUP BY product_id 
  ORDER BY product_id;