module.exports = {

    //Lists out the top x alcohols by the number of bottles sold
    topxAlcohol: (req, res, x) => {
        let theQuery = 'SELECT item_desc FROM iowa_liquor_sales GROUP BY item_desc ORDER BY SUM(bottle_sold) DESC LIMIT ' + x;
        db.query(theQuery , function (err, results) {
            if (err)
                throw err;
            res.send(JSON.stringify(results));
        });
    },
    
    //number of unique beverages
    uniqueBeverageCount: (req, res) => {
        let theQuery = 'SELECT count(DISTINCT item_desc) FROM iowa_liquor_sales; ';
        db.query(theQuery , function (err, results) {
            if (err)
                throw err;
            res.send(JSON.stringify(results));
        });
    },
    
    
}