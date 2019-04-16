module.exports = {

    //Lists out the top x alcohols by the number of bottles sold
    topxAlcohol: (req, res, x) => {
        let query = "SELECT item_desc FROM iowa_liquor_sales GROUP BY item_desc ORDER BY SUM(bottle_sold) DESC LIMIT " + x;
        db.query(query , function (err, results) {
            if (err)
                throw err;
            res.send(JSON.stringify(results));
        });
    },
    
    //number of unique beverages
    uniqueBeverageCount: (req, res) => {
        let query = "SELECT count(DISTINCT item_desc) FROM iowa_liquor_sales; ";
        db.query(query , function (err, results) {
            if (err)
                throw err;
            res.send(JSON.stringify(results));
        });
    },

    //all beverages that start with the input character
    beverageStartingWith: (req, res, startChar) => {
        let query = "SELECT DISTINCT item_desc FROM iowa_liquor_sales WHERE LEFT(item_desc , 1) = '" + startChar + "' ORDER BY item_desc;";
        db.query(query , function (err, results) {
            if (err)
                throw err;
            res.send(JSON.stringify(results));
        });
    },
    
    //beverages sold by x store
    soldByStore: (req, res) => {
        let query = "SELECT DISTINCT item_desc FROM iowa_liquor_sales WHERE store_name = 'Central City 2' ORDER BY item_desc";
        db.query(query , function (err, results) {
            if (err)
                throw err;
            res.send(JSON.stringify(results));
        });
    },

    //top x alcohols by city
    topAlcoholByCity: (req, res, x) => {
        let query = "SELECT DISTINCT item_desc , city , SUM(bottle_sold) FROM iowa_liquor_sales WHERE city = 'DES MOINES' GROUP BY item_desc ORDER BY SUM(bottle_sold) DESC LIMIT " + x;
        db.query(query , function (err, results) {
            if (err)
                throw err;
            res.send(JSON.stringify(results));
        });
    },

    //displays a list of stores that sell x alcohol
    storesThatSell: (req, res) => {
        let query = "SELECT DISTINCT store_name FROM iowa_liquor_sales WHERE item_desc = 'Godiva Liqueur' ORDER BY store_name;";
        db.query(query , function (err, results) {
            if (err)
                throw err;
            res.send(JSON.stringify(results));
        });
    },

    //Displays the top x most ordered beverages by ___ store
    popularByStore: (req, res, x) => {
        let query = "SELECT item_desc , store_name , SUM(bottle_sold) AS 'Total Bottles Sold' FROM iowa_liquor_sales WHERE store_name = 'Central City 2' GROUP BY item_desc ORDER BY SUM(bottle_sold) DESC LIMIT " + x;
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

    //Displays the top x stores with the highest revenue
    storeByRevenue: (req, res, x) => {
        let query = "SELECT store_name , SUM(sale) FROM iowa_liquor_sales GROUP BY store_name ORDER BY Count(item_desc) DESC LIMIT " + x;
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