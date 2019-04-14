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
});



app.get('/', function (req, res) {
    res.send('Hello World!');
});
app.listen(3000, function () {
    console.log('Example app listening on port 3000!');
});