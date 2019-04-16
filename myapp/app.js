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

app.get('/', function (req, res) {
    //test.topxAlcohol(req, res, 3);
    //test.uniqueBeverageCount(req, res);
    //test.beverageStartingWith(req, res, 'a');
    //test.soldByStore(req , res);
    //test.topAlcoholByCity(req , res , 10);
    test.storesThatSell(req , res);
});

app.listen(3000, function () {
    console.log('Example app listening on port 3000!');
});