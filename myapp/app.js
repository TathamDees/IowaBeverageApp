var express = require('express');
var app = express();
var mysql = require('mysql');
var test = require("./testQuery.js");

var db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'iowa_alcohol'
});

global.db = db;

app.get('/', function(req, res) {
    //test.mostPopularStoresByYear(req, res, 2018, 5);
    //test.storeByRevenueByCity(req, res, 'Waterloo', 5);
    ///test.topxAlcohol(req, res, 3);
    ///test.uniqueBeverageCount(req, res);
    ///test.beverageStartingWith(req, res, 'a');
    test.soldByStore(req , res, 'Central City 2');
    //test.topAlcoholByCity(req , res , 'DES MOINES', 10);
    //test.storesThatSell(req , res, 'Godiva Liqueur');
    //test.popularByStore(req , res , 'Central City 2', 5);
    //test.mostPopularStores(req , res , 5);
    //test.storeByRevenue(req , res , 5);
    //test.efficientDrinks(req , res , 10);
    //test.expensiveDrinks(req , res , 10);
    //test.liqourStoresInCity(req , res , 'DES MOINES');
});

app.listen(3000, function () {
    console.log('Example app listening on port 3000!');
});