var express = require("express");
var app = express();
var mysql = require("mysql");
var test = require("./testQuery.js");
//var front = require("/frontEnd");

var db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "iowa_alcohol"
});

global.db = db;



app.use(express.static('C:/Users/Tatham/Vandy/Databases/Project2/Project2Code/iowaAlc/myapp/frontEnd'));

app.get('/', function (req, res) {
  console.log("test");
  res.sendFile('C:/Users/Martin Wang/iowaAlc/myapp/frontEnd/index.html');
  // front.readFile(__dirname + '/index.html', function (err, data) {
  //   console.log(data.toString());
  // })
});

app.get("/cocktail", function (req, res) {
  test.cocktailGenerator(req, res, 3, 4);
});
app.get("/topAlcohol", function (req, res) {
  test.topxAlcohol(req, res, req.query.param);
});
app.get("/bevByLetter", function (req, res) {
    //var ddChar = 'a';
    test.beverageStartingWith(req, res, req.query.dataBox);
    //test.beverageStartingWith(req, res, 'a');
});

app.listen(8080, function () {
  console.log("Example app listening on port 8080!");
});
