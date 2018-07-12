-- Use the SUM/AVG/MAX/MIN function to get the total duration of all films
SELECT SUM(duration)
FROM films;

SELECT AVG(duration)
FROM films;

SELECT MAX(duration)
FROM films;

SELECT MIN(duration)
FROM films;

-- Get the amount grossed by the worst performing film in 1994.
SELECT MIN(gross)
FROM films
WHERE release_year = 1994;

-- Get the amount grossed by the best performing film between 2000 and 2012, inclusive
SELECT MAX(gross)
FROM films
WHERE release_year BETWEEN 2000 AND 2012;

-- Get the title and net profit (the amount a film grossed, minus its budget) for all films. Alias the net profit as net_profit
SELECT title, gross - budget AS net_profit
FROM films;

-- Get the average duration in hours for all films, aliased as avg_duration_hours
SELECT AVG(duration / 60.0) AS avg_duration_hours
FROM films;

-- Get the percentage of people who are no longer alive. Alias the result as percentage_dead. Remember to use 100.0 and not 100! 
SELECT COUNT(deathdate) * 100.0 / COUNT(*) AS percentage_dead
FROM people;

-- Get the number of decades the films table covers. Alias the result as number_of_decades. The top half of your fraction should be enclosed in parentheses 
SELECT (MAX(release_year) - MIN(release_year)) / 10.0
AS number_of_decades
FROM films;

