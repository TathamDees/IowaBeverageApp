# Create views
DROP VIEW IF EXISTS myview;
CREATE VIEW myview AS SELECT item_num FROM invoices GROUP BY item_num ORDER BY SUM(bottle_sold) DESC LIMIT 5;
DROP VIEW IF EXISTS myview;

DROP VIEW IF EXISTS beverageStoreView;
CREATE VIEW beverageStoreView AS SELECT distinct I.item_num FROM stores S INNER JOIN invoices I ON I.store_num = S.store_num 
WHERE store_name = 'Central City 2';

# Lists out the top 10 alcohols by the number of bottles sold
DROP VIEW if exists topxAlcoholView;
CREATE VIEW topxAlcoholView AS SELECT item_num FROM invoices GROUP BY item_num ORDER BY SUM(bottle_sold) DESC LIMIT 10;
SELECT distinct item_desc FROM items WHERE item_num IN (SELECT * FROM topxAlcoholView);

# Displays a list of every alcohol available
SELECT DISTINCT item_desc
FROM items
ORDER BY item_desc;

# Displays a number representing each unique alcohol available
SELECT count(DISTINCT item_desc)
FROM items;

# Displays a list of alcohol starting with ___ character
SELECT DISTINCT item_desc
FROM items
WHERE LEFT(item_desc , 1) = 'A'
ORDER BY item_desc;

# Beverages sold by certain store
DROP VIEW IF EXISTS beverageStoreView;
CREATE VIEW beverageStoreView AS SELECT distinct I.item_num FROM stores S INNER JOIN invoices I ON I.store_num = S.store_num 
WHERE store_name = 'Central City 2';
SELECT distinct item_desc FROM beverageStoreView INNER JOIN items ON beverageStoreView.item_num = items.item_num ORDER BY item_desc;

### Displays a list of alcohol that ___ store sells
SELECT DISTINCT IT.item_desc , S.store_name
FROM invoices I INNER JOIN items IT ON I.item_num = IT.item_num INNER JOIN stores S ON I.store_num = S.store_num
WHERE store_name = 'Central City 2';

### Displays a list of most popular alcohols in ___ city
SELECT DISTINCT item_desc , city , SUM(bottle_sold)
FROM iowa_liquor_sales
WHERE city = 'DES MOINES'
GROUP BY item_desc
ORDER BY SUM(bottle_sold) DESC
LIMIT 10;

### Displays a list of stores that sells ___ alcohol
SELECT DISTINCT store_name , item_desc
FROM iowa_liquor_sales
WHERE item_desc = 'Godiva Liqueur'
ORDER BY store_name;

### Displays the top 10 most ordered beverages by ___ store
SELECT item_desc , store_name , SUM(bottle_sold) AS 'Total Bottles Sold'
FROM iowa_liquor_sales
WHERE store_name = 'Central City 2'
GROUP BY item_desc
ORDER BY SUM(bottle_sold) DESC
LIMIT 10;

### Displays the stores top 10 that sold the most bottles
SELECT store_name , SUM(bottle_sold)
FROM iowa_liquor_sales
GROUP BY store_name
ORDER BY Count(item_desc) DESC
LIMIT 10;

### Displays the top 10 stores with the highest revenue
SELECT store_name , SUM(sale)
FROM iowa_liquor_sales
GROUP BY store_name
ORDER BY Count(item_desc) DESC
LIMIT 10;

### Displays the top 10 most efficient alcohol purchases in price per volume
SELECT item_desc , bottle_volume , state_bottle_retail , bottle_volume / state_bottle_retail AS 'volume (mL) per dollar'
FROM iowa_liquor_sales
GROUP BY item_desc
ORDER BY (bottle_volume / state_bottle_retail) DESC;

### Displays the top 10 most expensive alcohol purchases in dollars per volume (mL)
SELECT item_desc , state_bottle_retail , bottle_volume , state_bottle_retail/ bottle_volume AS 'dollars per mL'
FROM iowa_liquor_sales
GROUP BY item_desc
ORDER BY (bottle_volume / state_bottle_retail)
LIMIT 10;

### Displays the top 10 most purchased alcohol 
SELECT item_desc , SUM(bottle_sold)
FROM iowa_liquor_sales
GROUP BY item_desc
ORDER BY Count(item_desc) DESC
LIMIT 10;

# Displays the cities that sell ___ alcohol
SELECT DISTINCT item_desc , store_name
FROM iowa_liquor_sales
WHERE store_name = 'Central City 2'
ORDER BY item_desc;

### Displays the liqour stores in ___ city
SELECT DISTINCT store_name , city
FROM iowa_liquor_sales
WHERE city = 'Iowa City'
ORDER BY store_name;



# Testing
SELECT *
FROM iowa_liquor_sales;

SELECT *
FROM iowa_liquor_sales
WHERE item_desc = 'Crown Royal Multi Branded Shipper';

SELECT *
FROM county;

#SELECT items.item_desc FROM invoices INNER JOIN items ON invoices.item_num = items.item_num GROUP BY items.item_desc ORDER BY SUM(invoices.bottle_sold) DESC LIMIT 3;
#SELECT items.item_desc FROM invoices JOIN items ON invoices.item_num = items.item_num LIMIT 3;

Select items.item_desc
FROM items
WHERE items.item_num IN
(SELECT invoices.item_num
FROM invoices)
GROUP BY items.item_desc
ORDER BY COUNT(items.item_desc)
LIMIT 15;


SELECT item_desc
FROM items 
WHERE items.item_num IN
(SELECT item_num 
FROM invoices 
GROUP BY item_num 
ORDER BY SUM(bottle_sold) DESC)
LIMIT 5;


# Testing Transaction

START TRANSACTION;

CREATE VIEW myview AS SELECT item_num FROM invoices GROUP BY item_num ORDER BY SUM(bottle_sold) DESC LIMIT 5;
SELECT distinct item_desc FROM items WHERE item_num IN (SELECT * FROM myview);

COMMIT;



SELECT *
FROM address JOIN county;

### Randomly selects 1 alcohol
SELECT DISTINCT item_desc
FROM items
ORDER BY RAND()
LIMIT 1;

# Coctail generator!!!
# max parts = 4
# max drinks = Limit 5
SELECT DISTINCT item_desc AS 'alcohol' , ROUND(RAND() * 3 + 1) AS 'parts'
FROM items
ORDER BY RAND()
LIMIT 5;

# Displays the most expensive alcohol below a price
SELECT DISTINCT item_desc , state_bottle_retail
FROM items
WHERE state_bottle_retail < 143
ORDER BY state_bottle_retail DESC
LIMIT 10;

### Displays a list of alcohol starting with ___ character
SELECT DISTINCT item_desc
FROM iowa_liquor_sales
WHERE LEFT(item_desc , 1) = 'A'
ORDER BY item_desc;

SELECT *
FROM stores;