# Proyect 1: Netflix prices

<p> [ENG] The dataset downloaded from Kaggle.com contains 1 csv file and contains the prices of different Netflix plans in different countries in their local currency. It has 243 records and 12 fields. </p>

<p> [ESP] El conjunto de datos descargado de Kaggle.com contiene 1 archivo csv y contiene los precios de los diferentes planes de Netflix en diferentes países en su moneda local. Tiene 243 registros y 12 campos. </p>

|  Fields | Details  | Detalles  | 
| ---- | ---- | ---- | 
| Country | Country where Netflix is available | País donde Netflix está disponible |
| Code | ISO Alpha 2 country code | Código ISO Alfa 2 del país |
| Currency | Local currency  | Moneda local |
| Mobile | Mobile plan price in local currency  | Precio del plan Mobile en moneda local |
| Basic | Basic plan price in local currency  | Precio del plan Básico en moneda local |
| Standard | Standard plan price in local currency  | Precio del plan Standard en moneda local |
| Premium | Premium plan price in local currency  | Precio del plan Premium en moneda local |
| Convesion | Conversion rate to December 2021 dollar  | Tasa de conversión a dólar de diciembre del año 2021 |
| Mobile_USD | Mobile plan price in USD | Precio del plan Mobile en USD |
| Basic_USD | Basic plan price in USD  | Precio del plan Básico en USD |
| Standard_USD | Standard plan price in USD  | Precio del plan Standard en USD |
| Premium_USD | Premium plan price in USD  | Precio del plan Premium en USD |

## Exploration Data Analysis (EDA)

[ENG] Firstly, before loading the csv file into the RDBMS (relational database management system), a database with the name netflix was created and then this same database was selected to be used.

[ESP] Primeramente, antes de cargar el archivo csv en el sistema de administración de bases de datos relacionales, se creó una base de datos con el nombre de netflix y luego se seleccionó esta misma base de datos para ser utilizada.

```ruby
-- CREATE DATA BASE FOR THE DATASET --

CREATE DATABASE netflix;

-- SELECTING THE DATABASE TO USE --

USE netflix;
```

[ENG] Subsequently, the csv file was loaded into a table named netflix_prices, belonging to the database named netflix. Once the dataset was loaded, we started writing and executing the queries in order to start the exploratory data analysis. The first query run was executed to get an overview of the dataset.

[ESP] A continuación, se cargó el archivo csv en una tabla nombrada como netflix_prices, perteneciente a la base de datos nombrada como netflix. Una vez cargado el conjunto de datos, se comenzó a escribir y ejecutar las consultas para poder iniciar el análisis exploratorio de datos. La primera consulta realizada fue ejecutada para obtener una visión general del conjunto de datos.

```ruby
/*SEE OVERVIEW OF THE DATASET*/

SELECT *
FROM netflix_prices
LIMIT 10;
```
#### Question 1: How many columns does the dataset have?
```ruby
/*COUNT THE NUMBER OF ROWS IN THE DATASET*/

SELECT COUNT(*) AS Number_of_Rows
FROM netflix_prices;
```
> Output: **243 rows**.

#### Question 2: How many types of currencies are in the dataset?
```ruby
/* FIND TOTAL CURRENCY TYPE*/

SELECT COUNT(DISTINCT Currency) AS 'Number of Currency Types'
FROM netflix_prices;
```
> Output: **41 types of currencies**.

#### Question 3: What are the 8 most used currencies?
```ruby
/*TOP 8 MOST USED CURRENCIES*/

SELECT 
Currency, 
COUNT(Currency) AS 'Number of Countries'
FROM netflix_prices
GROUP BY Currency
ORDER BY COUNT(Currency) DESC
LIMIT 8;
```
> Output: The 8 most used currencies are the following

|  Currency | Number of Countries  |
| ---- | ---- |
| United States Dollar | 140 |
| Euro | 51 |
| British Pound | 4 |
| New Zealand Dollar | 4 |
| Krone | 4 |
| Danish Krone | 3 |
| Australian Dollar | 3 |
| Swiss Franc | 2 |

#### Question 4: What percentage of countries is the Mobile Plan price available in?
```ruby
/*PERCENTAGE OF COUNTRIES IN WHICH THE PRICE OF THE MOBILE PLAN IS AVAILABLE*/

SELECT ROUND(COUNT(Mobile)* 100 / 243,2) AS 'Percentage'
FROM netflix_prices
WHERE Mobile NOT IN (0);
```
> Output: **34,16%**.

#### Question 5: How many countries with U.S. dollar currency have no Mobile plan pricing available?
```ruby
/*NUMBER OF COUNTRIES WITH U.S. DOLLAR CURRENCY THAT DO NOT HAVE THE MOBIL PLAN AVAILABLE*/

SELECT COUNT(Mobile) AS 'Number of Countries'
FROM netflix_prices
WHERE Mobile_USD IN (0)
AND Currency='United States Dollar';
```
> Output: **67 countries**.

#### Question 6: Which are the 5 lowest priced countries for the Mobile Plan?
```ruby
/* TOP 5 COUNTRIES WITH LOWEST PRICE IN USD FOR MOBLINE PLAN*/

SELECT 
Country, 
ROUND(MIN(Mobile_USD),2) AS 'Mobile Plan Price in USD'
 FROM netflix_prices 
 GROUP BY Country
 HAVING MIN(Mobile_USD) NOT IN (0)
 ORDER BY MIN(Mobile_USD) ASC
 LIMIT 5;
```
> Output: The 5 lowest-priced countries are the following

|  Country | Mobile Plan Price in USD  |
| ---- | ---- |
| Pakistan | 1.4 |
| India | 1.96 |
| Kenya | 2.64 |
| Nigeria | 2.88 |
| Thailand | 2.96 |

#### Question 7: Which are the 5 countries with the highest prices for the Premium Plan?
```ruby
 SELECT 
 Country, 
 ROUND(MAX(Premium_USD),2) AS 'Premium Plan Price in USD'
 FROM netflix_prices
 GROUP BY Country
 ORDER BY MAX(Premium_USD) DESC
 LIMIT 5;
```
> Output: The 5 countries with the highest prices are the following

|  Country | Premium Plan Price in USD  |
| ---- | ---- |
| Turkey | 37.38 |
| Liechtenstein | 26.97 |
| Switzerland | 26.97 |
| Ireland | 20.34 |
| Antarctica | 20.34 |

#### Question 8: What is the average price in U.S. dollars for each type of plan?
```ruby
/*AVERAGE PRICE IN USD FOR EACH TYPE OF PLAN*/

SELECT 
ROUND(AVG(Mobile_USD),2) AS 'Average Mobile Plan Price in USD', 
ROUND(AVG(Basic_USD),2) AS 'Average Basic Plan Price in USD', 
ROUND(AVG(Standard_USD),2) AS 'Average Standard Plan Price in USD', 
ROUND(AVG(Premium_USD),2) AS 'Average Premium Plan Price in USD'
FROM netflix_prices;
```
> Output: The average prices in U.S. dollars for each type of plan are the following

|  Average Mobile Plan Price in USD | Average Basic Plan Price in USD  | Average Standard Plan Price in USD  | Average Premium Plan Price in USD  |
| ---- | ---- | ---- | ---- |
| 1.32 | 8.41 | 11.41 | 14.43 |

#### Question 9: What is the maximum price in US dollars for each type of plan?
```ruby
/*MAXIMUM PRICE IN USD OF EACH TYPE OF PLAN*/

SELECT 
ROUND(MAX(Mobile_USD),2) AS 'MAX Mobile Plan Price in USD', 
ROUND(MAX(Basic_USD),2) AS 'MAX Basic Plan Price in USD', 
ROUND(MAX(Standard_USD),2) AS 'MAX Standard Plan Price in USD', 
ROUND(MAX(Premium_USD),2) AS 'MAX Premium Plan Price in USD'
FROM netflix_prices
LIMIT 1;
```
> Output: The maximum prices in U.S. dollars for each type of plan are the following

|  MAX Mobile Plan Price in USD | MAX Basic Plan Price in USD  | MAX Standard Plan Price in USD  | MAX Premium Plan Price in USD  |
| ---- | ---- | ---- | ---- |
| 4.59 | 18.35 | 27.86 | 37.38 |

#### Question 10: What is the minimum price in U.S. dollars for each type of plan?
```ruby
*MINIMUM PRICE IN USD OF EACH TYPE OF PLAN*/

SELECT 
ROUND(MIN(Mobile_USD),2) AS 'MIN Mobile Plan Price in USD', 
ROUND(MIN(Basic_USD),2) AS 'MIN Basic Plan Price in USD', 
ROUND(MIN(Standard_USD),2) AS 'MIN Standard Plan Price in USD', 
ROUND(MIN(Premium_USD),2) AS 'MIN Premium Plan Price in USD'
FROM netflix_prices
WHERE Mobile_USD NOT IN (0)
LIMIT 1;
```
> Output: The minimum prices in US dollars for each type of plan are as follows

|  MIN Mobile Plan Price in USD | MIN Basic Plan Price in USD  | MIN Standard Plan Price in USD  | MIN Premium Plan Price in USD  |
| ---- | ---- | ---- | ---- |
| 1.4 | 2.53 | 4.49 | 6.17 |
