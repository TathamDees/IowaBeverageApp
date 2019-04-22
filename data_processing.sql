# item_num and item_desc  #########################################################################################

#subquery to select the first of each item_num

SELECT item_num , item_desc , Count(DISTINCT item_desc)
FROM iowa_liquor_sales
GROUP BY item_num
HAVING COUNT(distinct item_desc) > 1;

# Hash table of duplicated
CREATE TABLE hashVals (
	item_num			INT				PRIMARY KEY,
    item_desc			VARCHAR(100)	DEFAULT NULL);

# populated hashVals with itemnum is num for duplicates
INSERT INTO hashVals
SELECT item_num , item_desc
FROM (
SELECT item_num , item_desc , Count(DISTINCT item_desc)
FROM iowa_liquor_sales
GROUP BY item_num
HAVING COUNT(distinct item_desc) > 1
) AS deriv;

# Every bit of duplicated
SELECT item_num , item_desc
FROM iowa_liquor_sales
WHERE item_num IN 
(
SELECT item_num
FROM iowa_liquor_sales
GROUP BY item_num
HAVING COUNT(distinct item_desc) > 1
)
ORDER BY item_num;

SELECT * FROM hashVals;

UPDATE iowa_liquor_sales , hashVals
SET iowa_liquor_sales.item_desc = hashVals.item_desc
WHERE iowa_liquor_sales.item_num = hashVals.item_num;

SELECT * FROM iowa_liquor_sales;

SELECT county_num, county
FROM iowa_liquor_sales
GROUP BY county_num
HAVING COUNT(distinct county) > 1;

DROP Table if exists hashVals;









# category_num and category_name  #########################################################################################




#subquery to select the first of each category_num

SELECT category_num , category_name , Count(DISTINCT category_name)
FROM iowa_liquor_sales
GROUP BY category_num
HAVING COUNT(distinct category_name) > 1;

# Hash table of duplicated
CREATE TABLE hashVals (
	category_num			INT				PRIMARY KEY,
    category_name			VARCHAR(100)	DEFAULT NULL);

# populated hashVals with itemnum is num for duplicates
INSERT INTO hashVals
SELECT category_num , category_name
FROM (
SELECT category_num , category_name , Count(DISTINCT category_name)
FROM iowa_liquor_sales
GROUP BY category_num
HAVING COUNT(distinct category_name) > 1
) AS deriv;

# Every bit of duplicated
SELECT category_num , category_name
FROM iowa_liquor_sales
WHERE category_num IN 
(
SELECT category_num
FROM iowa_liquor_sales
GROUP BY category_num
HAVING COUNT(distinct category_name) > 1
)
ORDER BY category_num;

SELECT * FROM hashVals;

UPDATE iowa_liquor_sales , hashVals
SET iowa_liquor_sales.category_name = hashVals.category_name
WHERE iowa_liquor_sales.category_num = hashVals.category_num;

SELECT * FROM iowa_liquor_sales;


DROP Table if exists hashVals;








# store_num and store_name  #########################################################################################





#subquery to select the first of each store_num

SELECT store_num , store_name , Count(DISTINCT store_name)
FROM iowa_liquor_sales
GROUP BY store_num
HAVING COUNT(distinct store_name) > 1;

# Hash table of duplicated
CREATE TABLE hashVals (
	store_num			INT				PRIMARY KEY,
    store_name			VARCHAR(100)	DEFAULT NULL);

# populated hashVals with itemnum is num for duplicates
INSERT INTO hashVals
SELECT store_num , store_name
FROM (
SELECT store_num , store_name , Count(DISTINCT store_name)
FROM iowa_liquor_sales
GROUP BY store_num
HAVING COUNT(distinct store_name) > 1
) AS deriv;

# Every bit of duplicated
SELECT store_num , store_name
FROM iowa_liquor_sales
WHERE store_num IN 
(
SELECT store_num
FROM iowa_liquor_sales
GROUP BY store_num
HAVING COUNT(distinct store_name) > 1
)
ORDER BY store_num;

SELECT * FROM hashVals;

UPDATE iowa_liquor_sales , hashVals
SET iowa_liquor_sales.store_name = hashVals.store_name
WHERE iowa_liquor_sales.store_num = hashVals.store_num;

SELECT * FROM iowa_liquor_sales;

DROP Table if exists hashVals;








# county_num and county  #########################################################################################









#subquery to select the first of each county_num

SELECT county_num , county , Count(DISTINCT county)
FROM iowa_liquor_sales
GROUP BY county_num
HAVING COUNT(distinct county) > 1;

# Hash table of duplicated
CREATE TABLE hashVals (
	county_num			INT				PRIMARY KEY,
    county			VARCHAR(30)	DEFAULT NULL);

# populated hashVals with itemnum is num for duplicates
INSERT INTO hashVals
SELECT county_num , county
FROM (
SELECT county_num , county , Count(DISTINCT county)
FROM iowa_liquor_sales
GROUP BY county_num
HAVING COUNT(distinct county) > 1
) AS deriv;

# Every bit of duplicated
SELECT county_num , county
FROM iowa_liquor_sales
WHERE county_num IN 
(
SELECT county_num
FROM iowa_liquor_sales
GROUP BY county_num
HAVING COUNT(distinct county) > 1
)
ORDER BY county_num;

SELECT * FROM hashVals;

UPDATE iowa_liquor_sales , hashVals
SET iowa_liquor_sales.county = hashVals.county
WHERE iowa_liquor_sales.county_num = hashVals.county_num;

SELECT * FROM iowa_liquor_sales;

DROP Table if exists hashVals;








# vendor_num and vendor_name  #########################################################################################









#subquery to select the first of each item_num

SELECT vendor_num , vendor_name , Count(DISTINCT vendor_name)
FROM iowa_liquor_sales
GROUP BY vendor_num
HAVING COUNT(distinct vendor_name) > 1;

# Hash table of duplicated
CREATE TABLE hashVals (
	vendor_num			INT				PRIMARY KEY,
    vendor_name			VARCHAR(100)	DEFAULT NULL);

# populated hashVals with itemnum is num for duplicates
INSERT INTO hashVals
SELECT vendor_num , vendor_name
FROM (
SELECT vendor_num , vendor_name , Count(DISTINCT vendor_name)
FROM iowa_liquor_sales
GROUP BY vendor_num
HAVING COUNT(distinct vendor_name) > 1
) AS deriv;

# Every bit of duplicated
SELECT vendor_num , vendor_name
FROM iowa_liquor_sales
WHERE vendor_num IN 
(
SELECT vendor_num
FROM iowa_liquor_sales
GROUP BY vendor_num
HAVING COUNT(distinct vendor_name) > 1
)
ORDER BY vendor_num;

SELECT * FROM hashVals;

UPDATE iowa_liquor_sales , hashVals
SET iowa_liquor_sales.vendor_name = hashVals.vendor_name
WHERE iowa_liquor_sales.vendor_num = hashVals.vendor_num;

SELECT * FROM iowa_liquor_sales;

DROP Table if exists hashVals;



# Creating CSV of fixed table ####################################################################


#subquery to select the first of each item_num

SELECT store_num , street_address , Count(DISTINCT street_address)
FROM iowa_liquor_sales
GROUP BY store_num
HAVING COUNT(distinct street_address) > 1;

# Hash table of duplicated
CREATE TABLE hashVals (
	store_num			INT				PRIMARY KEY,
    street_address				VARCHAR(200)	DEFAULT NULL);

# populated hashVals with itemnum is num for duplicates
INSERT INTO hashVals
SELECT store_num , street_address
FROM (
SELECT store_num , street_address , Count(DISTINCT street_address)
FROM iowa_liquor_sales
GROUP BY store_num
HAVING COUNT(distinct street_address) > 1
) AS deriv;

# Every bit of duplicated
SELECT store_num , street_address
FROM iowa_liquor_sales
WHERE store_num IN 
(
SELECT store_num
FROM iowa_liquor_sales
GROUP BY store_num
HAVING COUNT(distinct street_address) > 1
)
ORDER BY store_num;

SELECT * FROM hashVals;

UPDATE iowa_liquor_sales , hashVals
SET iowa_liquor_sales.street_address = hashVals.street_address
WHERE iowa_liquor_sales.store_num = hashVals.store_num;

SELECT * FROM iowa_liquor_sales;

DROP Table if exists hashVals;