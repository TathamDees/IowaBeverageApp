# This script fixes the data where there are spelling inconsistencies for the same product due to changes in how items were recorded over the years
#For example, Bud Lite and Bud Lt would correspond to the same item, but were recorded under different names, messing up the creation of tables

# item_num and item_desc  #########################################################################################

DROP PROCEDURE IF EXISTS itemCleanup;
DELIMITER //
CREATE PROCEDURE itemCleanup()
BEGIN
	
    START TRANSACTION;

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

	UPDATE iowa_liquor_sales , hashVals
	SET iowa_liquor_sales.item_desc = hashVals.item_desc
	WHERE iowa_liquor_sales.item_num = hashVals.item_num;

	DROP Table if exists hashVals;

	COMMIT;
        
END //
DELIMITER ;

call itemCleanup();

# category_num and category_name  #########################################################################################

DROP PROCEDURE IF EXISTS categoryCleanup;
DELIMITER //
CREATE PROCEDURE categoryCleanup()
BEGIN
	
    START TRANSACTION;

	CREATE TABLE hashVals (
	category_num			INT				PRIMARY KEY,
    category_name			VARCHAR(100)	DEFAULT NULL);

	# populated hashVals with category_num is num for duplicates
	INSERT INTO hashVals
	SELECT category_num , category_name
	FROM (
	SELECT category_num , category_name , Count(DISTINCT category_name)
	FROM iowa_liquor_sales
	GROUP BY category_num
	HAVING COUNT(distinct category_name) > 1
	) AS deriv;

	UPDATE iowa_liquor_sales , hashVals
	SET iowa_liquor_sales.category_name = hashVals.category_name
	WHERE iowa_liquor_sales.category_num = hashVals.category_num;

	DROP Table if exists hashVals;

	COMMIT;
        
END //
DELIMITER ;

call categoryCleanup();

# store_num and store_name  #########################################################################################

DROP PROCEDURE IF EXISTS storeCleanup;
DELIMITER //
CREATE PROCEDURE storeCleanup()
BEGIN
	
    START TRANSACTION;

	CREATE TABLE hashVals (
	store_num			INT				PRIMARY KEY,
    store_name			VARCHAR(100)	DEFAULT NULL);

	# populated hashVals with store_num is num for duplicates
	INSERT INTO hashVals
	SELECT store_num , store_name
	FROM (
	SELECT store_num , store_name , Count(DISTINCT store_name)
	FROM iowa_liquor_sales
	GROUP BY store_num
	HAVING COUNT(distinct store_name) > 1
	) AS deriv;

	UPDATE iowa_liquor_sales , hashVals
	SET iowa_liquor_sales.store_name = hashVals.store_name
	WHERE iowa_liquor_sales.store_num = hashVals.store_num;

	DROP Table if exists hashVals;

	COMMIT;
        
END //
DELIMITER ;

call storeCleanup();

# county_num and county  #########################################################################################

DROP PROCEDURE IF EXISTS countyCleanup;
DELIMITER //
CREATE PROCEDURE countyCleanup()
BEGIN
	
    START TRANSACTION;

	CREATE TABLE hashVals (
	county_num			INT				PRIMARY KEY,
    county			VARCHAR(30)	DEFAULT NULL);

	# populated hashVals with county_num is num for duplicates
	INSERT INTO hashVals
	SELECT county_num , county
	FROM (
	SELECT county_num , county , Count(DISTINCT county)
	FROM iowa_liquor_sales
	GROUP BY county_num
	HAVING COUNT(distinct county) > 1
	) AS deriv;

	UPDATE iowa_liquor_sales , hashVals
	SET iowa_liquor_sales.county = hashVals.county
	WHERE iowa_liquor_sales.county_num = hashVals.county_num;

	DROP Table if exists hashVals;

	COMMIT;
        
END //
DELIMITER ;

call countyCleanup();

# vendor_num and vendor_name  #########################################################################################

DROP PROCEDURE IF EXISTS vendorCleanup;
DELIMITER //
CREATE PROCEDURE vendorCleanup()
BEGIN
	
    START TRANSACTION;

	CREATE TABLE hashVals (
	vendor_num			INT				PRIMARY KEY,
    vendor_name			VARCHAR(100)	DEFAULT NULL);

	# populated hashVals with vendor_num is num for duplicates
	INSERT INTO hashVals
	SELECT vendor_num , vendor_name
	FROM (
	SELECT vendor_num , vendor_name , Count(DISTINCT vendor_name)
	FROM iowa_liquor_sales
	GROUP BY vendor_num
	HAVING COUNT(distinct vendor_name) > 1
	) AS deriv;

	UPDATE iowa_liquor_sales , hashVals
	SET iowa_liquor_sales.vendor_name = hashVals.vendor_name
	WHERE iowa_liquor_sales.vendor_num = hashVals.vendor_num;

	DROP Table if exists hashVals;

	COMMIT;
        
END //
DELIMITER ;

call vendorCleanup();

# store_num and street_address ####################################################################

DROP PROCEDURE IF EXISTS streetCleanup;
DELIMITER //
CREATE PROCEDURE streetCleanup()
BEGIN
	
    START TRANSACTION;

	CREATE TABLE hashVals (
	store_num			INT				PRIMARY KEY,
    street_address				VARCHAR(200)	DEFAULT NULL);

	# populated hashVals with store_num is num for duplicates
	INSERT INTO hashVals
	SELECT store_num , street_address
	FROM (
	SELECT store_num , street_address , Count(DISTINCT street_address)
	FROM iowa_liquor_sales
	GROUP BY store_num
	HAVING COUNT(distinct street_address) > 1
	) AS deriv;

	UPDATE iowa_liquor_sales , hashVals
	SET iowa_liquor_sales.street_address = hashVals.street_address
	WHERE iowa_liquor_sales.store_num = hashVals.store_num;

	DROP Table if exists hashVals;

	COMMIT;
        
END //
DELIMITER ;

call streetCleanup();
