/* This script creates the tables for the Iowa Liquor Stores Database */



/* This will create the counties table*/

--DROP TABLE counties

CREATE TABLE counties (
county text,
population integer
);

SELECT *
FROM counties;



/* This will create the products table*/

--DROP TABLE products

CREATE TABLE products (
item_no	integer,
category_name	text,
item_description	text,
vendor	integer,
vendor_name	text,
bottle_size	integer,
pack	integer,
inner_pack	integer,
age	integer,
proof	integer,
list_date	date,
upc	integer,
scc	integer,
bottle_price	money,
shelf_price	numeric,
case_cost	numeric
);

SELECT *
FROM products;



/* This will create the sales table*/

--DROP TABLE sales

CREATE TABLE sales (
date	datetime,
convenience_store	text,
store	integer,
county_number	integer,
county	text,
category	integer,
category_name	text,
vendor_no	integer,
vendor	text,
item	integer,
description	text,
pack	integer,
liter_size	integer,
state_btl_cost	money,
btl_price	money,
bottle_qty	integer,
revenue	numeric
);


SELECT *
FROM sales;



/* This will create the stores table*/

--DROP TABLE stores

CREATE TABLE stores (
store	integer,
name	text,
store_status	text,
store_address	text,
address_info text
);


SELECT *
FROM stores;



/* This will create the fy17p table*/

--DROP TABLE fy17p

CREATE TABLE fy17p (
fy	integer,
pd	integer,
store_name	text,
week1	numeric,
week2	numeric,
week3	numeric,
week4	numeric
);

SELECT *
FROM fy17p;



/* This will create the fy18p table*/

--DROP TABLE fy18p

CREATE TABLE fy18p (
fy	integer,
pd	integer,
store_name	text,
week1	numeric,
week2	numeric,
week3	numeric,
week4	numeric
);

SELECT *
FROM fy18p;
