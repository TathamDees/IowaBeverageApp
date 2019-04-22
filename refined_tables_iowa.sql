DROP TABLE IF EXISTS invoices;
CREATE TABLE invoices (
	invoice_number		VARCHAR(30)		PRIMARY KEY,
	invoice_date		VARCHAR(12)		DEFAULT NULL,
    bottle_sold			INT				DEFAULT NULL,
    store_num			INT				DEFAULT NULL,
    item_num			INT				DEFAULT NULL,
    
    CONSTRAINT invoice_fk_dates
    FOREIGN KEY (invoice_date)
    REFERENCES dates(invoice_date),
    
    CONSTRAINT invoices_fk_store
    FOREIGN KEY (store_num)
    REFERENCES stores(store_num),
    
    CONSTRAINT invoices_fk_item
    FOREIGN KEY (item_num)
    REFERENCES items (item_num)
);

DROP TABLE IF EXISTS dates;
CREATE TABLE dates (
	invoice_date		VARCHAR(12)		PRIMARY KEY
);

DROP TABLE IF EXISTS stores;
CREATE TABLE stores (
    store_num			INT				PRIMARY KEY,
	store_name			VARCHAR(100)	DEFAULT NULL,
    street_address		VARCHAR(200)	DEFAULT NULL,
    
    CONSTRAINT stores_fk
    FOREIGN KEY (street_address)
    REFERENCES address (street_address)
);

DROP TABLE IF EXISTS address;
CREATE TABLE address (
    street_address		VARCHAR(200)	NOT NULL,
    city				VARCHAR(30)		NOT NULL,
    zip_code			VARCHAR(6)		NOT NULL,
    county_num			INT				NOT NULL,
    PRIMARY KEY (street_address, city, zip_code, county_num),
    
    CONSTRAINT address_fk
    FOREIGN KEY (county_num)
    REFERENCES county (county_num)
);

DROP TABLE IF EXISTS items;
CREATE TABLE items (
	item_num			INT				NOT NULL,
    invoice_date		VARCHAR(12)		NOT NULL,
	item_desc			VARCHAR(100)	DEFAULT NULL, 
    vendor_num			INT				DEFAULT NULL,
    category_num		INT				DEFAULT NULL,
	state_bottle_cost	DECIMAL(8,2)	DEFAULT NULL,
    state_bottle_retail	DECIMAL(8,2)	DEFAULT NULL,
    bottle_volume		INT				DEFAULT NULL,
    pack				INT				DEFAULT NULL,
    primary key(item_num, invoice_date),
    
    CONSTRAINT item_specs_fk_items
    FOREIGN KEY (item_num)
    REFERENCES items (item_num),
    
    CONSTRAINT items_specs_fk_dates
    FOREIGN KEY (invoice_date)
    REFERENCES dates(invoice_date)
);

DROP TABLE IF EXISTS county;
CREATE TABLE county (
	county_num			INT				PRIMARY KEY,	
    county				VARCHAR(30)		DEFAULT NULL
);

DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
	category_num		INT				PRIMARY KEY,
    category_name		VARCHAR(100)	DEFAULT NULL
);

DROP TABLE IF EXISTS vendors;
CREATE TABLE vendors (
	vendor_num			INT				PRIMARY KEY,
    vendor_name			VARCHAR(100)	DEFAULT NULL
);

 
INSERT INTO invoices (invoice_number, invoice_date, bottle_sold, store_num, item_num)
SELECT invoice_number, invoice_date, bottle_sold, store_num, item_num
FROM iowa_liquor_sales;

SELECT *
FROM invoices;

INSERT INTO dates (invoice_date)
SELECT DISTINCT invoice_date
FROM iowa_liquor_sales;

SELECT *
FROM dates;

INSERT INTO county (county_num, county)
SELECT DISTINCT county_num, county
FROM iowa_liquor_sales;

SELECT *
FROM county;

INSERT INTO categories (category_num, category_name)
SELECT DISTINCT category_num, category_name
FROM iowa_liquor_sales;

SELECT *
FROM categories;

INSERT INTO vendors (vendor_num, vendor_name)
SELECT DISTINCT vendor_num, vendor_name
FROM iowa_liquor_sales;

SELECT *
FROM vendors;

INSERT INTO items (item_num, invoice_date, item_desc, vendor_num, category_num, state_bottle_cost, state_bottle_retail, bottle_volume, pack)
SELECT DISTINCT item_num, invoice_date, item_desc, vendor_num, category_num, state_bottle_cost, state_bottle_retail, bottle_volume, pack
FROM iowa_liquor_sales;

SELECT *
FROM items;

INSERT INTO stores (store_num, store_name, street_address)
SELECT DISTINCT store_num, store_name, street_address
FROM iowa_liquor_sales;

SELECT *
FROM stores;

INSERT INTO address (street_address, city, zip_code, county_num)
SELECT DISTINCT street_address, city, zip_code, county_num
FROM iowa_liquor_sales;
