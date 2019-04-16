module.exports = {

    //Lists out the top x alcohols by the number of bottles sold
    topxAlcohol: (req, res, x) => {
        let theQuery = "SELECT item_desc FROM iowa_liquor_sales GROUP BY item_desc ORDER BY SUM(bottle_sold) DESC LIMIT " + x;
        db.query(theQuery , function (err, results) {
            if (err)
                throw err;
            res.send(JSON.stringify(results));
        });
    },
    
    //number of unique beverages
    uniqueBeverageCount: (req, res) => {
        let theQuery = "SELECT count(DISTINCT item_desc) FROM iowa_liquor_sales; ";
        db.query(theQuery , function (err, results) {
            if (err)
                throw err;
            res.send(JSON.stringify(results));
        });
    },

    //all beverages that start with the input character                 (DOESN'T WORK CURRENTLY)
    beverageStartingWith: (req, res, startChar) => {
        let theQuery = "SELECT DISTINCT item_desc FROM iowa_liquor_sales WHERE LEFT(item_desc , 1) = 'A' ORDER BY item_desc;";
        //let theQuery = "SELECT DISTINCT item_desc FROM iowa_liquor_sales WHERE LEFT(item_desc , 1) = ' + startChar + ' ORDER BY item_desc;";
        //let theQuery = 'SELECT DISTINCT item_desc FROM iowa_liquor_sales WHERE LEFT(item_desc , 1) = ${startChar} ORDER BY item_desc;';
        db.query(theQuery , function (err, results) {
            if (err)
                throw err;
            res.send(JSON.stringify(results));
        });
    },
    
    
    
}