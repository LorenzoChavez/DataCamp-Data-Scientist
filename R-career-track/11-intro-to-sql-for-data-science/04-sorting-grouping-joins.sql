-- Get the birth date and name for every person, in order of when they were born
SELECT name, birthdate
FROM people 
ORDER BY birthdate

-- Get all details for all films except those released in 2015 and order them by duration
SELECT *
FROM films
WHERE release_year NOT IN (2015)
ORDER BY duration;

-- Get the title and gross earnings for movies which begin with the letter 'M' and order the results alphabetically
SELECT title, gross
FROM films
WHERE title LIKE 'M%'
ORDER BY title;

-- Get the IMDB score and film ID for every film from the reviews table, sorted from highest to lowest score
SELECT imdb_score, film_id
FROM reviews
ORDER BY imdb_score DESC;

-- Get certifications, release years, and titles of films ordered by certification (alphabetically) and release year
SELECT title, release_year, certification
FROM films
ORDER BY certification, release_year;

-- Get the IMDB score and count of film reviews grouped by IMDB score in the reviews table
SELECT imdb_score, COUNT(*)
FROM reviews
GROUP BY imdb_score;

-- Get the country, release year, and lowest amount grossed per release year per country. Order your results by country and release year
SELECT release_year, country, MIN(gross)
FROM films
GROUP BY release_year, country
ORDER BY country, release_year;

-- ***
SELECT release_year, 
        AVG(budget) AS avg_budget, 
        AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year
HAVING AVG(budget) > 60000000
ORDER BY avg_gross DESC;

-- Get the country, average budget, and average gross take of countries that have made more than 10 films. 
-- Order the result by country name, and limit the number of results displayed to 5. 
-- You should alias the averages as avg_budget and avg_gross respectively.
SELECT country, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
FROM films
GROUP BY country
HAVING COUNT(title) > 10
ORDER BY country
LIMIT 5;

-- The query has to get the IMDB score for the film To Kill a Mockingbird! 
SELECT title, imdb_score
FROM films
JOIN reviews
ON films.id = reviews.film_id
WHERE title = 'To Kill a Mockingbird';
