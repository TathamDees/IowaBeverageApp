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
    test.query1(req, res);
});

app.listen(3000, function () {
    console.log('Example app listening on port 3000!');
});