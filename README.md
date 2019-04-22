# iowaAlc

Original Dataset can be downloaded [here](https://data.iowa.gov/Economy/Iowa-Liquor-Sales/m3tr-qhgy/data)
Our preprocessed data can be extracted from iowa_sales_data.zip (Compressed File - 37.5 MB, Actual Size - 217.8 MB) in db

To run the application:

1. Run `git clone https://github.com/TathamDees/iowaAlc.git`

1. Install Node: https://nodejs.org/en/download/
2. Install required Node modules with these commands:
	-`npm install mysql`
	-`npm install express`
	
3. Extract the .csv file from iowa_sales_data.zip in db and place it in the tmp folder inside your wamp/mamp folder (e.g. c:/wamp64/tmp/)

4. Update iowa_sales_revised.csv file path in line 35 with your own file path of load_data_iowa .sql file and then run the file

5. Run the data_processing file to make minor data modifications before dividing up into separate tables

6. Run refined_tables_iowa to create the tables in the updated database design and insert the appropriate data in each one

7. Navigate to application/ directory and run `node app.js`

8. Open http://localhost:8080/ in browser to view application


Application Demonstration can be found [here](https://www.youtube.com/watch?v=RX8i2p9tUPs)