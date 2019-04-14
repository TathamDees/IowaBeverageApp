// JavaScript source code
module.exports = {
    query1: (req, res) =>
        db.query("SELECT item_desc , store_name , SUM(bottle_sold) AS 'Total Bottles Sold' FROM iowa_liquor_sales WHERE store_name = 'Central City 2' GROUP BY item_desc ORDER BY SUM(bottle_sold) DESC LIMIT 10", function (err, results) {
            if (err)
                throw err;
            console.log(results);
        });
    }
}