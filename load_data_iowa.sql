DROP DATABASE IF EXISTS iowa_alcohol;
CREATE DATABASE iowa_alcohol;
USE iowa_alcohol;


# SHOW VARIABLES LIKE "secure_file_priv";

DROP TABLE IF EXISTS iowa_liquor_sales;
CREATE TABLE iowa_liquor_sales (
	invoice_number		VARCHAR(30)		PRIMARY KEY,
    invoice_date		VARCHAR(12)		DEFAULT NULL,		
    store_num			INT				DEFAULT NULL,
	store_name			VARCHAR(100)	DEFAULT NULL,
    street_address		VARCHAR(200)	DEFAULT NULL,
    city				VARCHAR(30)		DEFAULT NULL,
    zip_code			VARCHAR(6)		DEFAULT NULL,
    county_num			INT				DEFAULT NULL,	
    county				VARCHAR(30)		DEFAULT NULL,
    category_num		INT				DEFAULT NULL,
    category_name		VARCHAR(100)	DEFAULT NULL,
    vendor_num			INT				DEFAULT NULL,
    vendor_name			VARCHAR(100)	DEFAULT NULL,
    item_num			INT				DEFAULT NULL,
    item_desc			VARCHAR(100)	DEFAULT NULL,
    pack				INT				DEFAULT NULL,
    bottle_volume		INT				DEFAULT NULL,
    state_bottle_cost	DECIMAL(8,2)	DEFAULT NULL,
    state_bottle_retail	DECIMAL(8,2)	DEFAULT NULL,
    bottle_sold			INT				DEFAULT NULL,
    sale				DECIMAL(8,2)	DEFAULT NULL,
    volume_sold_liters	DECIMAL(8,2)	DEFAULT NULL,
    volume_sold_gallons	DECIMAL(8,2)	DEFAULT NULL
);

LOAD DATA INFILE "c:/wamp64/tmp/iowa_sales_revised.csv"
INTO TABLE iowa_alcohol.iowa_liquor_sales
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(invoice_number , invoice_date , store_num, store_name, street_address, city, zip_code,
county_num, county, category_num, category_name, vendor_num, vendor_name, item_num,
item_desc, pack, bottle_volume, state_bottle_cost, state_bottle_retail, bottle_sold,
sale, volume_sold_liters, volume_sold_gallons);