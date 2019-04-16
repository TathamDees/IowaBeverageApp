module.exports = {

    //Lists out the top x alcohols by the number of bottles sold
    topxAlcohol: (req, res, x) => {
        //let query = "SELECT item_desc FROM iowa_liquor_sales GROUP BY item_desc ORDER BY SUM(bottle_sold) DESC LIMIT " + x;
        //let query = "SELECT items.item_desc FROM invoices INNER JOIN items ON invoices.item_num = items.item_num GROUP BY items.item_desc ORDER BY SUM(invoices.bottle_sold) DESC LIMIT " + x;
        let dropView = "DROP VIEW if exists topxAlcoholView";
        let createView = "CREATE VIEW topxAlcoholView AS SELECT item_num FROM invoices GROUP BY item_num ORDER BY SUM(bottle_sold) DESC LIMIT " + x;
        let topFive = "SELECT distinct item_desc FROM items WHERE item_num IN (SELECT * FROM topxAlcoholView);";
        
        db.query(dropView, function (err, results) {
            if (err)
                throw err;
        });
        
        db.query(createView, function (err, results) {
            if (err)
                throw err;
        });

        db.query(topFive, function(err, results) {
            if (err)
                throw err;
            res.send(JSON.stringify(results));
        });
    },
    
    //number of unique beverages
    uniqueBeverageCount: (req, res) => {
        //let query = "SELECT count(DISTINCT item_desc) FROM iowa_liquor_sales; ";
        let query = "SELECT count(DISTINCT item_desc) FROM items;"
        
        db.query(query , function (err, results) {
            if (err)
                throw err;
            res.send(JSON.stringify(results));
        });
    },

    //all beverages that start with the input character
    beverageStartingWith: (req, res, startChar) => {
        //let query = "SELECT DISTINCT item_desc FROM iowa_liquor_sales WHERE LEFT(item_desc , 1) = '" + startChar + "' ORDER BY item_desc;";
        let query = "SELECT DISTINCT item_desc FROM items WHERE LEFT(item_desc , 1) = '" + startChar + "' ORDER BY item_desc;";
        
        db.query(query , function (err, results) {
            if (err)
                throw err;
            res.send(JSON.stringify(results));
        });
    },
    
    //beverages sold by x store
    soldByStore: (req, res, theStore) => {
        let query = "SELECT DISTINCT item_desc FROM iowa_liquor_sales WHERE store_name = '" + theStore + "' ORDER BY item_desc";

        db.query(query , function (err, results) {
            if (err)
                throw err;
            res.send(JSON.stringify(results));
        });
    },

    //top x alcohols by city
    topAlcoholByCity: (req, res, theCity, x) => {
        let query = "SELECT DISTINCT item_desc , city , SUM(bottle_sold) FROM iowa_liquor_sales WHERE city = '" + theCity + "' GROUP BY item_desc ORDER BY SUM(bottle_sold) DESC LIMIT " + x;
        db.query(query , function (err, results) {
            if (err)
                throw err;
            res.send(JSON.stringify(results));
        });
    },

    //displays a list of stores that sell x alcohol
    storesThatSell: (req, res, theAlcohol) => {
        let query = "SELECT DISTINCT store_name FROM iowa_liquor_sales WHERE item_desc = '" + theAlcohol + "' ORDER BY store_name;";
        db.query(query , function (err, results) {
            if (err)
                throw err;
            res.send(JSON.stringify(results));
        });
    },

    //Displays the top x most ordered beverages by ___ store
    popularByStore: (req, res, theStore, x) => {
        let query = "SELECT item_desc , store_name , SUM(bottle_sold) AS 'Total Bottles Sold' FROM iowa_liquor_sales WHERE store_name = '" + theStore + "' GROUP BY item_desc ORDER BY SUM(bottle_sold) DESC LIMIT " + x;
        db.query(query , function (err, results) {
            if (err)
                throw err;
            res.send(JSON.stringify(results));
        });
    },

    //Displays the top x stores that sold the most bottles
    mostPopularStores: (req, res, x) => {
        let query = "SELECT store_name , SUM(bottle_sold) FROM iowa_liquor_sales GROUP BY store_name ORDER BY Count(item_desc) DESC LIMIT " + x;
        db.query(query , function (err, results) {
            if (err)
                throw err;
            res.send(JSON.stringify(results));
        });
    },

    //Displays the top x stores that sold the most bottles in a particular year
    mostPopularStoresByYear: (req, res, year, x) => {
        let query = "SELECT store_name , SUM(bottle_sold) FROM iowa_liquor_sales WHERE invoice_date LIKE '%" + year + "' GROUP BY store_name ORDER BY Count(item_desc) DESC LIMIT " + x;
        db.query(query, function(err, results) {
            if (err)
                throw err;
            res.send(JSON.stringify(results));
        });
    },

    //Displays the top x stores with the highest revenue
    storeByRevenue: (req, res, x) => {
        let query = "SELECT store_name , SUM(sale) FROM iowa_liquor_sales GROUP BY store_name ORDER BY Count(item_desc) DESC LIMIT " + x;
        db.query(query , function (err, results) {
            if (err)
                throw err;
            res.send(JSON.stringify(results));
        });
    },

    //Displays the top x stores with the highest revenue in particular city
    storeByRevenueByCity: (req, res, city, x) => {
        let query = "SELECT store_name , SUM(sale) FROM iowa_liquor_sales WHERE city = '" + city + "' GROUP BY store_name ORDER BY Count(item_desc) DESC LIMIT " + x;
        db.query(query, function(err, results) {
            if (err)
                throw err;
            res.send(JSON.stringify(results));
        });
    },

    //Displays the top 10 most efficient alcohol purchases in price per volume
    efficientDrinks: (req, res, x) => {
        let query = "SELECT item_desc , bottle_volume , state_bottle_retail , bottle_volume / state_bottle_retail AS 'volume (mL) per dollar' FROM iowa_liquor_sales GROUP BY item_desc ORDER BY (bottle_volume / state_bottle_retail) DESC LIMIT " + x;
        db.query(query , function (err, results) {
            if (err)
                throw err;
            res.send(JSON.stringify(results));
        });
    },

    //Displays the top x stores with the highest revenue
    storeByRevenue: (req, res, x) => {
        let query = "SELECT store_name , SUM(sale) FROM iowa_liquor_sales GROUP BY store_name ORDER BY Count(item_desc) DESC LIMIT " + x;
        db.query(query, function(err, results) {
            if (err)
                throw err;
            res.send(JSON.stringify(results));
        });
    },

    //Displays the top 10 most expensive alcohol purchases in dollars per volume (mL)
    expensiveDrinks: (req, res, x) => {
        let query = "SELECT item_desc , state_bottle_retail , bottle_volume , state_bottle_retail/ bottle_volume AS 'dollars per mL' FROM iowa_liquor_sales GROUP BY item_desc ORDER BY (bottle_volume / state_bottle_retail) LIMIT " + x;
        db.query(query , function (err, results) {
            if (err)
                throw err;
            res.send(JSON.stringify(results));
        });
    },

    //Displays the liqour stores in ___ city
    liqourStoresInCity: (req, res, theCity) => {
        let query = "SELECT DISTINCT store_name , city FROM iowa_liquor_sales WHERE city = '" + theCity + "' ORDER BY store_name;";
        db.query(query , function (err, results) {
            if (err)
                throw err;
            res.send(JSON.stringify(results));
        });
    },

    // Randomly selects x beverages
    randomBeverageSelector: (req, res, x) => {
        let query = "SELECT DISTINCT item_desc FROM items ORDER BY RAND() LIMIT " + x;
        db.query(query , function (err, results) {
            if (err)
                throw err;
            res.send(JSON.stringify(results));
        });
    },

    // Randomly generate a cocktail with maximum p Parts for a Alcohols
    cocktailGenerator: (req, res, p, a) => {
        let query = "SELECT DISTINCT item_desc AS 'alcohol' , ROUND(RAND() * " + (p - 1) + " + 1) AS 'parts' FROM items ORDER BY RAND() LIMIT " + a;
        db.query(query , function (err, results) {
            if (err)
                throw err;
            res.send(JSON.stringify(results));
        });
    },
    
    /*
    //
    method: (req, res) => {
        let query = "";
        db.query(query , function (err, results) {
            if (err)
                throw err;
            res.send(JSON.stringify(results));
        });
    },
    */
}