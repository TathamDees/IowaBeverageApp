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
  //test.mostPopularStoresByYear(req, res, 2018, 5);
  //test.storeByRevenueByCity(req, res, 'Waterloo', 5);
  //test.topxAlcohol(req, res, 3);
  //test.uniqueBeverageCount(req, res);
  //test.beverageStartingWith(req, res, 'a');
  ///test.topxAlcohol(req, res, 3);
  ///test.uniqueBeverageCount(req, res);
  ///test.beverageStartingWith(req, res, 'a');
  //test.soldByStore(req , res, 'Central City 2');
  //test.topAlcoholByCity(req , res , 'DES MOINES', 10);
  test.storesThatSell(req, res, 'Godiva Liqueur');
  //test.popularByStore(req , res , 'Central City 2', 5);
  //test.mostPopularStores(req , res , 5);
  //test.storeByRevenue(req , res , 5);
  //test.efficientDrinks(req , res , 10);
  //test.expensiveDrinks(req , res , 10);
  //test.liqourStoresInCity(req , res , 'DES MOINES');
  //test.randomBeverageSelector(req , res , 3);
  //test.cocktailGenerator(req , res , 3 , 4);
});


app.get('/', function (req, res) {
  console.log("test");
  res.sendFile('C:/Users/vedan/iowaAlc/myapp/frontEnd/index.html');
});

app.get("/foo", function (req, res) {
  console.log("ksjdgkjnfdskjgd");
  //test.mostPopularStoresByYear(req, res, 2018, 5);
  //test.storeByRevenueByCity(req, res, 'Waterloo', 5);
  //test.topxAlcohol(req, res, 3);
  //test.uniqueBeverageCount(req, res);
  //test.beverageStartingWith(req, res, 'a');
  test.topxAlcohol(req, res, 3);
  ///test.uniqueBeverageCount(req, res);
  ///test.beverageStartingWith(req, res, 'a');
  //test.soldByStore(req , res, 'Central City 2');
  //test.topAlcoholByCity(req , res , 'DES MOINES', 10);
  //test.storesThatSell(req , res, 'Godiva Liqueur');
  //test.popularByStore(req , res , 'Central City 2', 5);
  //test.mostPopularStores(req , res , 5);
  //test.storeByRevenue(req , res , 5);
  //test.efficientDrinks(req , res , 10);
  //test.expensiveDrinks(req , res , 10);
  //test.liqourStoresInCity(req , res , 'DES MOINES');
  //test.randomBeverageSelector(req , res , 3);
  //test.cocktailGenerator(req, res, 3, 4);
});
app.get("/cocktail", function (req, res) {
  test.cocktailGenerator(req, res, 3, 4);
});

app.get("/topAlcohol", function (req, res) {
  test.topxAlcohol(req, res, 3);
});

app.get("/soldByStore", function (req, res) {
    //console.log("WORKING");
    test.soldByStore(req, res, req.query.storeName);
});

app.listen(8080, function () {
  console.log("Example app listening on port 8080!");
});
