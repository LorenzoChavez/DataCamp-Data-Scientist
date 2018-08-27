-- Inner join the cities table on the left to the countries table on the right, keeping all of the fields in both tables. 
-- You should join on the country_code field in cities and the code field in countries.

SELECT *
FROM cities
INNER JOIN countries
ON cities.country_code = countries.code

-- Modify the SELECT statement to keep only the name of the city, the name of the country, and the name of the region the country resides in.
SELECT cities.name AS city, 
        countries.name AS country, 
        countries.region
FROM cities
INNER JOIN countries
ON cities.country_code = countries.code


-- Select country code, name of the country, year, and inflation rate
as the fields from an inner join of countries on the left with economies on the right. 
SELECT c.code AS country_code, 
       c.name, 
       e.year, 
       e.inflation_rate
FROM countries AS c
INNER JOIN economies AS e
ON c.code = e.code;

-- Create an inner join with countries on the left and populations on the right.
-- Alias countries AS c and populations AS p
-- Select country code, name, and region from countries and also select year and fertility_rate from populations
SELECT c.code, name, region, e.year, fertility_rate, unemployment_rate
FROM countries AS c
INNER JOIN populations AS p
ON c.code = p.country_code
INNER JOIN economies AS e
ON c.code = e.code AND e.year = p.year;

-- Inner join countries on the left and languages on the right USING code
SELECT c.name AS country, c.continent, l.name AS language, l.official
FROM countries AS c
INNER JOIN languages AS l
USING (code);

-- Join populations with itself ON country_code.
-- Select the country_code and size from p1 and the size from p2 as your fields.
SELECT p1.country_code,
       p1.size AS size2010, 
       p2.size AS size2015,
       ((p2.size - p1.size)/p1.size * 100.0) AS growth_perc
FROM populations AS p1
INNER JOIN populations AS p2
ON p1.country_code = p2.country_code
    AND p1.year = p2.year - 5;



-- get name, continent, code, and surface area
SELECT name, continent, code, surface_area,
    -- first case
     CASE WHEN surface_area > 2000000
    -- first then
            THEN  'large'
    -- second case
        WHEN surface_area > 350000
    -- second then
            THEN 'medium'
    -- else clause + end
       ELSE 'small' END
    -- alias resulting field of CASE WHEN
       AS geosize_group
-- from the countries table
FROM countries;



SELECT country_code, size,
  -- start CASE here with WHEN and THEN
    CASE WHEN size > 50000000
            THEN 'large'
  -- layout other CASE conditions here
    WHEN size > 1000000
            THEN 'medium'
  -- end CASE here with ELSE & END
    ELSE 'small' END  
  -- provide the alias of popsize_group to SELECT the new field
     AS popsize_group
-- which table?
FROM populations
-- any conditions to check?
WHERE year = 2015

