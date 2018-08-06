--  calculate the average life expectancy across all countries for 2015
SELECT *
FROM populations
WHERE life_expectancy >
  1.15 * (SELECT AVG(life_expectancy)
   FROM populations
   WHERE year = 2015) AND
  year = 2015;


-- select the appropriate fields
SELECT name, country_code, urbanarea_pop
-- from the cities table
FROM  cities
-- with city name in the field of capital cities
WHERE name IN
  (SELECT capital
   FROM countries)
ORDER BY urbanarea_pop DESC;


/* SELECT countries.name AS country, COUNT(*) AS cities_num
FROM cities
INNER JOIN countries
ON countries.code = cities.country_code
GROUP BY country
ORDER BY cities_num DESC, country
LIMIT 9;*/

SELECT countries.name AS country,
  (SELECT COUNT(*)
   FROM cities
   WHERE countries.code = cities.country_code) AS cities_num
FROM countries
ORDER BY cities_num DESC, country
LIMIT 9;


-- Begin by determining for each country code how many languages are listed in the languages table using SELECT, FROM, and GROUP BY
SELECT local_name, subquery.lang_num
FROM countries,
  (SELECT code, COUNT(*) AS lang_num
   FROM languages
   GROUP BY code) AS subquery
WHERE countries.code = subquery.code
ORDER BY lang_num DESC;


-- Create an inner join with countries on the left and economies on the right with USING.
-- Do not alias your tables or columns.
SELECT name, continent, inflation_rate
FROM countries
INNER JOIN economies
ON countries.code = economies.code
WHERE year = 2015
    AND inflation_rate IN (
        SELECT MAX(inflation_rate) AS max_inf
        FROM (
             SELECT name, continent, inflation_rate
             FROM countries
             INNER JOIN economies
             ON countries.code = economies.code
             WHERE year = 2015) AS subquery
        GROUP BY continent);


-- Select the country code, inflation rate, and unemployment rate
SELECT code, inflation_rate, unemployment_rate
FROM economies
WHERE year = 2015 AND code NOT IN
  (SELECT code
   FROM countries
   WHERE (gov_form = 'Constitutional Monarchy' OR gov_form LIKE '%Republic'))
ORDER BY inflation_rate;


-- Select unique country names. Also select the total investment and imports fields.
-- Use a left join with countries on the left.
SELECT DISTINCT name, total_investment, imports
FROM countries AS c
LEFT JOIN economies AS e
ON (c.code = e.code
  AND c.code IN (
    SELECT l.code
    FROM languages AS l
    WHERE official = 't'
  ) )
WHERE region = 'Central America' AND year = 2015
ORDER BY name;


-- choose fields
SELECT region, continent, AVG(fertility_rate) AS avg_fert_rate
-- left table
FROM countries AS c
-- right table
INNER JOIN populations AS p
-- join conditions
ON c.code = p.country_code
-- specific records matching a condition
WHERE year = 2015
-- aggregated for each what?
GROUP BY region, continent
-- how should we sort?
ORDER BY avg_fert_rate;


-- Select the city name, country code, city proper population, and metro area population
-- Calculate the percentage of metro area population composed of city proper population for each city in cities, aliased as city_perc
-- Focus only on capital cities in Europe and the Americas in a subquery
SELECT name, country_code, city_proper_pop, metroarea_pop,  
      city_proper_pop / metroarea_pop * 100.0 AS city_perc
FROM cities
WHERE name IN
  (SELECT capital
   FROM countries
   WHERE (continent = 'Europe'
      OR continent LIKE '%America'))
     AND metroarea_pop IS NOT NULL
ORDER BY city_perc DESC
LIMIT 10;








