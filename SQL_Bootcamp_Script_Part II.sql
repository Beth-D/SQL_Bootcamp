/* GENERAL ASSEMBLY - SQL BOOTCAMP PART II */


/* APPLYING FUNCTIONS IN SQL */

--GUIDED PRACTICE: MATH FUNCTIONS


SELECT store, COUNT(revenue)
FROM sales
GROUP BY store
LIMIT 100


SELECT store, AVG(revenue)
FROM sales
GROUP BY store
LIMIT 100


SELECT store, MIN(revenue)
FROM sales
GROUP BY store
LIMIT 100


SELECT store, MAX(revenue)
FROM sales
GROUP BY store
LIMIT 100


SELECT store, SUM(revenue)
FROM sales
GROUP BY store
LIMIT 100

SELECT store, 
COUNT(revenue) AS count_sales,
AVG(revenue) AS avg_sales,
MIN(revenue) AS min_sales,
MAX(revenue) AS max_sales,
SUM(revenue) AS sum_sales
FROM sales
GROUP BY store
LIMIT 100


--INDEPENDENT PRACTICE

--Q1) What is the total of number of bottles sold (bottle_qty) and the total sales (revenue) in our dataset?
SELECT SUM(bottle_qty), SUM(revenue)
FROM sales


﻿--Q2) How many stores are there by store_status, i.e. how many are active and how many are inactive?
SELECT store_status, COUNT(store)
FROM stores
GROUP BY store_status
﻿
--Q3) What is the average case_cost and average shelf_price by item_description for only category_name 'SCOTCH WHISKIES'? 
SELECT item_description, AVG(case_cost), AVG(shelf_price)
FROM products
WHERE category_name = 'SCOTCH WHISKIES'
GROUP BY item_description


--GUIDED PRACTICE: STRING FUNCTIONS


SELECT item || ' - ' || description
FROM sales
LIMIT 100


SELECT UPPER(description), LOWER(category_name)
FROM sales
LIMIT 100


--GUIDED PRACTICE: DATE FUNCTIONS


SELECT item, revenue, date, CURRENT_DATE
FROM sales
LIMIT 100



SELECT item, revenue, date, CURRENT_DATE, 
JULIANDAY(CURRENT_DATE) - JULIANDAY(date)
FROM sales
LIMIT 100



/* QUERYING LARGE DATABASES IN SQL */

--UNIONS

SELECT *
FROM FY17P
UNION
SELECT *
FROM FY18P


--UNION removes duplicates

SELECT * 
FROM FY17p
WHERE store_name = 'PORTLAND'
UNION
SELECT *
FROM FY17p
WHERE store_name = 'PORTLAND'


--UNION ALL does not remove duplicates

SELECT * 
FROM FY17p
WHERE store_name = 'PORTLAND'
UNION ALL
SELECT *
FROM FY17p
WHERE store_name = 'PORTLAND'


--JOINS

SELECT 
a.store,
a.description,
b.store_status
FROM sales a
JOIN stores b
ON a.store = b.store
LIMIT 100


--INDEPENDENT PRACTICE: JOINS

SELECT a.item, 
a.description,
b.proof
FROM sales a		
JOIN products b
ON a.item = b.item_no
LIMIT 100	

--Or you could also do this to bring back all columns in table sales with a.* and then any other specific tables

SELECT a.*,
b.proof
FROM sales a		
JOIN products b
ON a.item = b.item_no
LIMIT 100



--INDEPENDENT PRACTICE: JOINING MULTIPLE TABLES

SELECT 
a.item, 
b.name,
c.case_cost,
d.population
FROM sales a
JOIN stores b
ON a.store=b.store
JOIN products c
ON a.item=c.item_no
JOIN counties d
ON a.county = d.county
LIMIT 100



--INDEPENDENT PRACTICE: LET'S BRING IT ALL TOGETHER!

--Q1) Could you show me a list of sales with the average case cost by item but only for products with proof above 80?

SELECT a.item, b.proof, AVG(b.case_cost)
FROM sales a
JOIN products b
ON a.item = b.item_no
WHERE b.proof > 80
GROUP BY a.item, b.proof


--Q2) I think that our sales table is great, however could I have a new column where I can see the store number and name together e.g. ‘3692 - Wilkie Liquors’?

SELECT a.store || ' - ' || b.name, a.*
FROM sales a
JOIN stores b
ON a.store = b.store


--Q3) We have been stocking some products for a long time now. Are you able to tell me, by category name, what is the maximum number of days we’ve had a product listed for? (e.g. days since list date)

SELECT category_name, MAX(JULIANDAY(CURRENT_DATE)-JULIANDAY(list_date))
FROM products
GROUP BY category_name


