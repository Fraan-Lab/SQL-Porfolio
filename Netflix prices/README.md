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

[ENG] First, before loading the csv file into the RDBMS (relational database management system), a database with the name netflix was created and then this same database was selected to be used.

[ESP] Primeramente, antes de cargar el archivo csv en el sistema de administración de bases de datos relacionales, se creó una base de datos con el nombre de netflix y luego se seleccionó esta misma base de datos para ser utilizada.

```
-- CREATE DATA BASE FOR THE DATASET --

CREATE DATABASE netflix;

-- SELECTING THE DATABASE TO USE --

USE netflix;
```
