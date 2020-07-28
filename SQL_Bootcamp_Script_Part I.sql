/* GENERAL ASSEMBLY - SQL BOOTCAMP PART I */


/* FUNDAMENTALS OF DATABASES AND SQL*/

--HAVE A QUICK LOOK INTO TABLES

SELECT *
FROM sales
LIMIT 100

SELECT *
FROM products
LIMIT 100

SELECT *
FROM stores
LIMIT 100

SELECT *
FROM counties
LIMIT 100



--DEMO: BASIC SQL

SELECT * 
FROM products 
WHERE category_name = 'SCOTCH WHISKIES'

SELECT * 
FROM products 
WHERE case_cost >= 100

SELECT * 
FROM products 
WHERE case_cost >= 100 
ORDER BY 1



/* FILTERING AND AGGREGATING IN SQL*/

--GUIDED PRACTICE: WHERE CONDITIONS


SELECT * 
FROM products 
WHERE vendor_name != 'Jim Beam Brands'

SELECT * 
FROM products 
WHERE pack >= 12

SELECT * 
FROM products 
WHERE case_cost < 60

SELECT * 
FROM products 
WHERE category_name IN ('SINGLE MALT SCOTCH', 'CANADIAN WHISKIES')

SELECT * 
FROM products 
WHERE category_name LIKE '%whiskies%'

SELECT * 
FROM products 
WHERE category_name NOT LIKE '%whiskies%'

SELECT * 
FROM products 
WHERE shelf_price BETWEEN 4 AND 10



--INDEPENDENT PRACTICE: WHERE CONDITIONS


Which products have a case cost of more than $100?
3738 rows
SELECT * 
FROM products
WHERE case_cost > 100


Which tequilas have a case cost of more than $100?
422 rows
SELECT * 
FROM products 
WHERE case_cost > 100 AND category_name = 'TEQUILA'


Which tequilas or scotch whiskies have a case cost of more than $100?
687 rows
SELECT * 
FROM products 
WHERE case_cost > 100 AND category_name IN ('TEQUILA', 'SCOTCH WHISKIES')


Which whiskies of any kind cost between $100 and $150?
400 rows
SELECT * 
FROM products
WHERE case_cost between 100 AND 150 AND category_name LIKE '%whiskies%'


Which products except tequilas cost between $100 and $120?
976 rows
SELECT * 
FROM products 
WHERE case_cost BETWEEN 100 AND 120 AND category_name != 'TEQUILA'


--AGGREGATION: GROUP BY

SELECT store, item, sum(revenue)
FROM sales
WHERE revenue > 200
GROUP BY store, item
ORDER by store, item
LIMIT 50


--AGGREGATION: HAVING

SELECT store, item, sum(revenue)
FROM sales
WHERE revenue > 200
GROUP BY store, item
HAVING sum(revenue) < 1000
ORDER by sum(revenue) DESC
LIMIT 50


