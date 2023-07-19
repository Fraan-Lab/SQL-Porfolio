/*NETFLIX PRICES EXPLORATORY DATA ANALYSIS USING SQL*/

/*DATABASE CREATION AND IMPORT OF THE DATASET*/

-- CREATE DATA BASE FOR THE DATASET --

CREATE DATABASE netflix;

-- SELECTING THE DATABASE TO USE --

USE netflix;

-----------------------------------------------------------------------------------------------------------------

/*SEE OVERVIEW OF THE DATASET*/

SELECT *
FROM netflix_prices
LIMIT 10;

-----------------------------------------------------------------------------------------------------------------

/*COUNT THE NUMBER OF ROWS IN THE DATASET*/

SELECT COUNT(*) AS Number_of_Rows
FROM netflix_prices;

-----------------------------------------------------------------------------------------------------------------

/* FIND TOTAL CURRENCY TYPE*/

SELECT COUNT(DISTINCT Currency) AS 'Number of Currency Types'
FROM netflix_prices;

-----------------------------------------------------------------------------------------------------------------

/*TOP 8 MOST USED CURRENCIES*/

SELECT 
Currency, 
COUNT(Currency) AS 'Number of Countries'
FROM netflix_prices
GROUP BY Currency
ORDER BY COUNT(Currency) DESC
LIMIT 8;

-----------------------------------------------------------------------------------------------------------------

/*PERCENTAGE OF COUNTRIES IN WHICH THE PRICE OF THE MOBILE PLAN IS AVAILABLE */

SELECT ROUND(COUNT(Mobile)* 100 / 243,2) AS 'Percentage'
FROM netflix_prices
WHERE Mobile NOT IN (0);

-----------------------------------------------------------------------------------------------------------------

/*NUMBER OF COUNTRIES WITH U.S. DOLLAR CURRENCY THAT DO NOT HAVE THE MOBIL PLAN AVAILABLE*/

SELECT COUNT(Mobile) AS 'Number of Countries'
FROM netflix_prices
WHERE Mobile_USD IN (0) 
AND Currency='United States Dollar';

-----------------------------------------------------------------------------------------------------------------

/* TOP 5 COUNTRIES WITH LOWEST PRICE IN USD FOR MOBLINE PLAN*/

SELECT 
Country, 
ROUND(MIN(Mobile_USD),2) AS 'Mobile Plan Price in USD'
 FROM netflix_prices 
 GROUP BY Country
 HAVING MIN(Mobile_USD) NOT IN (0)
 ORDER BY MIN(Mobile_USD) ASC
 LIMIT 5;

-----------------------------------------------------------------------------------------------------------------

/*TOP 5 COUNTRIES WITH THE HIGHEST PRICE IN USD FOR PREMIUM PLAN*/

 SELECT 
 Country, 
 ROUND(MAX(Premium_USD),2) AS 'Premium Plan Price in USD'
 FROM netflix_prices
 GROUP BY Country
 ORDER BY MAX(Premium_USD) DESC
 LIMIT 5;

-----------------------------------------------------------------------------------------------------------------

/*AVERAGE PRICE IN USD FOR EACH TYPE OF PLAN*/

SELECT 
ROUND(AVG(Mobile_USD),2) AS 'Average Mobile Plan Price in USD', 
ROUND(AVG(Basic_USD),2) AS 'Average Basic Plan Price in USD', 
ROUND(AVG(Standard_USD),2) AS 'Average Standard Plan Price in USD', 
ROUND(AVG(Premium_USD),2) AS 'Average Premium Plan Price in USD'
FROM netflix_prices;

-----------------------------------------------------------------------------------------------------------------

/*MAXIMUM PRICE IN USD OF EACH TYPE OF PLAN*/

SELECT 
ROUND(MAX(Mobile_USD),2) AS 'MAX Mobile Plan Price in USD', 
ROUND(MAX(Basic_USD),2) AS 'MAX Basic Plan Price in USD', 
ROUND(MAX(Standard_USD),2) AS 'MAX Standard Plan Price in USD', 
ROUND(MAX(Premium_USD),2) AS 'MAX Premium Plan Price in USD'
FROM netflix_prices
LIMIT 1;

-----------------------------------------------------------------------------------------------------------------

/*MINIMUM PRICE IN USD OF EACH TYPE OF PLAN*/

SELECT 
ROUND(MIN(Mobile_USD),2) AS 'MIN Mobile Plan Price in USD', 
ROUND(MIN(Basic_USD),2) AS 'MIN Basic Plan Price in USD', 
ROUND(MIN(Standard_USD),2) AS 'MIN Standard Plan Price in USD', 
ROUND(MIN(Premium_USD),2) AS 'MIN Premium Plan Price in USD'
FROM netflix_prices
WHERE Mobile_USD NOT IN (0)
LIMIT 1;

-----------------------------------------------------------------------------------------------------------------

/*COUNTRIES USING EURO AND U.S. DOLLAR CURRENCY WITH A BASIC PLAN OF LESS THAN 10 USD*/

SELECT 
Country,
Basic_USD
FROM netflix_prices
WHERE Currency IN('United States Dollar', 'Euro')
AND Basic_USD < 10
ORDER BY Basic_USD DESC;
