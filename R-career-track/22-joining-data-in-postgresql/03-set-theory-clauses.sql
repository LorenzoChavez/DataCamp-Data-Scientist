-- pick specified columns from 2010 table
SELECT *
-- 2010 table will be on top
FROM economies2010
-- which set theory clause?
UNION
-- pick specified columns from 2015 table
SELECT  *
-- 2015 table on the bottom
FROM economies2015
-- order accordingly
ORDER BY code, year;


-- Determine all (non-duplicated) country codes in either the cities or the currencies table. 
-- The result should be a table with only one field called country_code
SELECT country_code
FROM cities
UNION
SELECT code
FROM currencies
ORDER BY country_code;


-- Determine all combinations (include duplicates) of country code and year that exist in either the economies or the populations tables. Order by code then year
SELECT code, year
FROM economies
UNION ALL
SELECT country_code, year
FROM populations
ORDER BY code, year;


-- Again, order by code and then by year, both in ascending order
SELECT code, year
FROM economies
INTERSECT
SELECT 	country_code, year
FROM populations
ORDER BY code, year;

-- Use INTERSECT to answer this question with countries and cities
SELECT name
FROM cities
INTERSECT
SELECT name
FROM countries;


-- Order the resulting field in ascending order
SELECT name
FROM cities
EXCEPT
SELECT capital
FROM countries
ORDER BY name;


-- Order by capital in ascending order.
SELECT capital
FROM countries
EXCEPT
SELECT name
FROM cities
ORDER BY capital;


/*SELECT *
FROM countries
WHERE region = 'Middle East';*/

SELECT DISTINCT(name)
FROM languages
ORDER BY name;


-- Begin by determining the number of countries in countries that are listed in Oceania using SELECT, FROM, and WHERE
SELECT code, name
FROM countries
WHERE continent = 'Oceania'
  AND code NOT IN
  (SELECT code
   FROM currencies);


-- select the city name
SELECT name
-- alias the table where city name resides
FROM  cities AS c1
-- choose only records matching the result of multiple set theory clauses
WHERE country_code IN
(
    -- select appropriate field from economies AS e
    SELECT e.code
    FROM economies AS e
    -- get all additional (unique) values of the field from currencies AS c2  
    UNION
    SELECT c2.code
    FROM currencies  AS c2
    -- exclude those appearing in populations AS p
    EXCEPT
    SELECT p.country_code
    FROM populations AS p
);

