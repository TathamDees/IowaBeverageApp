var express = require('express');
var app = express();
var mysql = require('mysql');

var db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'iowa_alcohol'
});

db.connect((err) => {
    if (err) {
        throw err;
    }
    console.log("Connected to database...");
    db.query("SELECT item_desc , store_name , SUM(bottle_sold) AS 'Total Bottles Sold' FROM iowa_liquor_sales WHERE store_name = 'Central City 2' GROUP BY item_desc ORDER BY SUM(bottle_sold) DESC LIMIT 10", function (err, results) {
        if (err)
            throw err;
        console.log(results);
    });

});



app.get('/', function (req, res) {
    res.send('Databases Final Project');
});
app.listen(3000, function () {
    console.log('Example app listening on port 3000!');
});