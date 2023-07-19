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

```
-- CREATE DATA BASE FOR THE DATASET --

CREATE DATABASE netflix;

-- SELECTING THE DATABASE TO USE --

USE netflix;
```

[ENG] Following this, the csv file was uploaded to a database table named netflix. Once the dataset was loaded, we started writing and running queries in order to analyze the data. The first query run was executed to get an overview of the dataset.

[ESP] A continuación, se cargó el archivo csv en una tabla de la base de datos llamada netflix. Una vez cargado el conjunto de datos, se comenzó a escribir y ejecutar las consultas para poder analizar los datos. La primera consulta realizada fue ejecutada para obtener una visión general del conjunto de datos.

```
/*SEE OVERVIEW OF THE DATASET*/

SELECT *
FROM netflix_prices
LIMIT 10;
```
#### Question 1: How many columns does the dataset have?
```
/*COUNT THE NUMBER OF ROWS IN THE DATASET*/

SELECT COUNT(*) AS Number_of_Rows
FROM netflix_prices;
```
> Output: **243 rows**.

#### Question 2: How many types of currencies are in the dataset?
```
/* FIND TOTAL CURRENCY TYPE*/
SELECT COUNT(DISTINCT Currency) AS 'Number of Currency Types'
FROM netflix_prices;
```
> Output: **41 types of currencies**.

#### Question 3: What are the 8 most used currencies?
```
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
