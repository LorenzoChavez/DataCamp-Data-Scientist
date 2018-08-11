-- Get the title and release year of films released after 2000
SELECT title, release_year
FROM films
WHERE release_year > 2000;

-- Get the name and birth date of the person born on November 11th, 1974. Remember to use ISO date format ('1974-11-11')!
SELECT name, birthdate
FROM people
WHERE birthdate = '1974-11-11'

-- Get the number of Hindi language films
SELECT COUNT(*)
FROM films
WHERE language = 'Hindi'

-- Get all details for all films with an R certification
SELECT *
FROM films
WHERE certification = 'R'

-- Get all details for Spanish language films released after 2000, but before 2010
SELECT *
FROM films
WHERE release_year < 2010
AND language = 'Spanish'
AND release_year > 2000;

-- Get the title and release year for films released in the 90s.
SELECT title, release_year
FROM films
WHERE release_year >= 1990
AND release_year <= 1999;

-- Now, build on your query to filter the records to only include French or Spanish language films
SELECT title, release_year
FROM films
WHERE release_year >= 1990
AND release_year <= 1999
AND (language = 'Spanish' OR language = 'French');

-- Finally, restrict the query to only return films that took in more than $2M gross.
SELECT title, release_year
FROM films
WHERE release_year >= 1990
AND release_year <= 1999
AND (language = 'Spanish' OR language = 'French')
AND gross > 2000000;

------- *** 

-- Modify to your previous query to include all Spanish language or French language films with the same criteria as before. Don't forget your parentheses!

SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
AND budget > 100000000
AND (language = 'Spanish' OR language = 'French')

-- Get the title and certification of all films with an NC-17 or R certification
SELECT title, certification 
FROM films
WHERE certification IN ('NC-17', 'R')

-- Get the number of films which don't have a language associated with them.
SELECT COUNT(*)
FROM films
WHERE language ISNULL

-- Get the names of people whose names have 'r' as the second letter. The pattern you need is '_r%'
SELECT name
FROM people
WHERE name LIKE '_r%'

-- Get the names of people whose names don't start with A. The pattern you need is 'A%'
SELECT name
FROM people
WHERE name NOT LIKE 'A%'

