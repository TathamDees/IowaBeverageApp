var express = require("express");
var app = express();
var mysql = require("mysql");
var test = require("./testQuery.js");

var db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "iowa_alcohol"
});

global.db = db;

app.use(express.static('C:/Users/vedan/iowaAlc/myapp/frontEnd'));

app.get('/', function (req, res) {
  console.log("test");
    res.sendFile('C:/Users/vedan/iowaAlc/myapp/frontEnd.index.html');
});

app.get("/cocktail", function (req, res) {
  test.cocktailGenerator(req, res, 3, 4);
});

app.get("/topAlcohol", function (req, res) {
  test.topxAlcohol(req, res, req.query.param);
});
app.get("/bevByLetter", function (req, res) {
    test.beverageStartingWith(req, res, req.query.dataBox);
});

app.get("/soldByStore", function (req, res) {
    test.soldByStore(req, res, req.query.storeName);
});

app.listen(8080, function () {
  console.log("Example app listening on port 8080!");
});
