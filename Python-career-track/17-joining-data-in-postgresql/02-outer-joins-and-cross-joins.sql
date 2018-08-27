-- get the city name (and alias it), the country code,
-- the country name (and alias it), the region,
-- and the city proper population
SELECT c1.name AS city, code, c2.name AS country,
       region, city_proper_pop
-- specify left table       
FROM cities AS c1
-- specify right table and type of join
INNER JOIN countries AS c2
-- how should the tables be matched?
ON c1.country_code = c2.code
-- sort based on descending country code
ORDER BY code DESC;


/*
select country name AS country, the country's local name,
the language name AS language, and
the percent of the language spoken in the country
*/
SELECT  c.name AS country, local_name, l.name AS language, percent
-- countries on the left (alias as c)
FROM countries  AS c
-- inner join with languages (as l) on the right
INNER JOIN languages  AS l
-- give fields to match on
ON c.code = l.code
-- sort by descending country name
ORDER BY country DESC;


-- select name, region, and gdp_percapita
SELECT region, AVG(gdp_percapita) AS avg_gdp
-- countries (alias c) on the left
FROM countries AS c
-- join with economies (alias e)
LEFT JOIN economies AS e
-- match on code fields
ON c.code = e.code
-- focus on 2010 entries
WHERE e.year = 2010
GROUP BY region
ORDER BY avg_gdp DESC;



-- convert this code to use RIGHT JOINs instead of LEFT JOINs
/*
SELECT cities.name AS city, urbanarea_pop, countries.name AS country,
       indep_year, languages.name AS language, percent
FROM cities
LEFT JOIN countries
ON cities.country_code = countries.code
LEFT JOIN languages
ON countries.code = languages.code
ORDER BY city, language;
*/
SELECT cities.name AS city, urbanarea_pop, countries.name AS country,
       indep_year, languages.name AS language, percent
FROM languages
RIGHT JOIN countries
ON languages.code = countries.code
RIGHT JOIN cities
ON countries.code = cities.country_code
ORDER BY city, language;


-- Choose records in which region corresponds to North America or is NULL
SELECT name AS country, code, region, basic_unit
FROM countries
FULL JOIN currencies
USING (code)
WHERE region = 'North America' OR region IS NULL
ORDER BY region;

-- Choose records in which countries.name starts with the capital letter 'V' or is NULL. Lastly, arrange by countries.name in ascending order to more clearly see the results.
SELECT countries.name, code, languages.name AS language
FROM languages
FULL JOIN countries
USING (code)
WHERE countries.name LIKE 'V%' OR countries.name IS NULL
ORDER BY countries.name;


-- Complete a full join with countries on the left and languages on the right.
-- Next, full join this result with currencies on the right.
-- Select the fields corresponding to the country name AS country, region, language name AS language, and basic and fractional units of currency.
-- Use LIKE to choose the Melanesia and Micronesia regions.
SELECT c1.name AS country, region, l.name AS language,
       basic_unit, frac_unit
FROM countries  AS c1
FULL JOIN languages AS l
USING (code)
FULL JOIN currencies AS c2
USING (code)
WHERE region LIKE 'M%esia';


-- Create the cross join above and select only the city name AS city and language name AS language. (Recall that cross joins do not use ON or USING
SELECT c.name AS city, l.name AS language
FROM cities AS c        
INNER JOIN languages AS l
ON c.country_code = l.code
WHERE c.name LIKE 'Hyder%';


-- Select country name AS country, region, and life expectancy AS life_exp
SELECT c.name AS country,
       region,
       p.life_expectancy AS life_exp
FROM countries AS c
LEFT JOIN populations AS p
ON c.code = p.country_code
WHERE p.year = 2010
ORDER BY p.life_expectancy
LIMIT 5;





