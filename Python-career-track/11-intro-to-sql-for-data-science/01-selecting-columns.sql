-- Select the release_year column from the films table
SELECT release_year 
FROM films;

-- Get the title, release year and country for every film
SELECT title, release_year, country FROM films

-- Get all the different film certifications from the films table
SELECT DISTINCT certification FROM films

-- Count the number of rows in the people table
SELECT COUNT(*)
FROM people;

-- Count the number of (non-missing) birth dates in the people table
SELECT COUNT(birthdate)
FROM people;

-- Count the number of unique birth dates in the people table
SELECT COUNT(DISTINCT birthdate)
FROM people;

-- Count the number of unique languages in the films table
SELECT COUNT(DISTINCT language)
FROM films;

-- Count the number of unique countries in the films table.
SELECT COUNT(DISTINCT country)
FROM films;
