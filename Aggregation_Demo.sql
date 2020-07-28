## Example to demonstrate default aggregation function in SQLite

--1) Let's find a store-item combination that has more than one record


SELECT store, item, COUNT(*) AS number_records, SUM(revenue)
FROM sales
GROUP BY store, item
ORDER BY 3 desc


--I'm going to pick store = 2512 and item = 19477 for this example


--2) If I look at the raw data, I see two records with different date and revenue

SELECT store, item, date, revenue
FROM sales
WHERE store = 2512 AND item = 19477


--3) However, when I use GROUP BY, only one date and one revenue show. Can you see which aggregation function is taking place?


SELECT store, item, date, revenue
FROM sales
WHERE store = 2512 AND item = 19477
GROUP BY store, item


--4) Let's compare the different types of aggregations. The default is MIN!

SELECT store, item, date, MIN(date), MAX(date), revenue, MIN(revenue), MAX(revenue), SUM(revenue)
FROM sales
WHERE store = 2512 AND item = 19477
GROUP BY store, item
