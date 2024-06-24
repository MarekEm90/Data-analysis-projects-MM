SELECT * FROM imdb.titles;

-- Return the number of titles created in the USA in 6 years before 2011

SELECT 
	release_year, 
    COUNT(title) as US_titles
FROM 
	titles
WHERE 
	production_countries LIKE '%US%' AND release_year BETWEEN (2011 - 6) AND 2011
GROUP BY 
	release_year;

-- Find the Top 5 Movies with the Highest IMDb Scores and List Their Main Cast Members

WITH TopMovies AS (
    SELECT 
        id, 
        title, 
        imdb_score 
    FROM 
        titles 
    ORDER BY 
        imdb_score DESC 
    LIMIT 5
)
SELECT 
    tm.title, 
    tm.imdb_score, 
    c.name AS cast_member, 
    c.character, 
    c.role
FROM 
    TopMovies tm
JOIN 
    cast c 
ON 
    tm.id = c.id
ORDER BY 
    tm.imdb_score DESC, 
    c.role;
    
    
-- List All Movies Released After 2010 with an IMDb Score Above the Average IMDb Score of All Movies

WITH AvgIMDBScore AS (
    SELECT 
        AVG(imdb_score) AS avg_score 
    FROM 
        titles
)
SELECT 
    t.title, 
    t.release_year, 
    t.imdb_score 
FROM 
    titles t
JOIN 
    AvgIMDBScore a 
ON 
    t.imdb_score > a.avg_score 
WHERE 
    t.release_year > 2010
ORDER BY 
    t.imdb_score DESC;

-- Categorize Movies as "Hit" or "Flop" Based on IMDb Score

WITH AvgIMDBScore AS (
    SELECT 
        AVG(imdb_score) AS avg_score 
    FROM 
        titles
)
SELECT 
    t.title,
    t.imdb_score,
    CASE 
        WHEN t.imdb_score > (SELECT avg_score FROM AvgIMDBScore) THEN 'Hit'
        ELSE 'Flop'
    END AS movie_status
FROM 
    titles t
ORDER BY 
    t.imdb_score DESC;

-- Find the Highest-Rated Movie for Each Genre, Filling in Missing IMDb Scores with the Average IMDb Score

WITH AvgIMDBScore AS (
    SELECT 
        AVG(imdb_score) AS avg_score 
    FROM 
        titles
),
MoviesWithAdjustedScores AS (
    SELECT 
        id,
        title,
        genres,
        COALESCE(imdb_score, (SELECT avg_score FROM AvgIMDBScore)) AS adjusted_imdb_score
    FROM 
        titles
)
SELECT 
    mwg.genres,
    mwg.title,
    mwg.adjusted_imdb_score
FROM 
    (
        SELECT 
            genres, 
            MAX(adjusted_imdb_score) AS max_score
        FROM 
            MoviesWithAdjustedScores
        GROUP BY 
            genres
    ) AS max_scores_per_genre
JOIN 
    MoviesWithAdjustedScores mwg 
ON 
    max_scores_per_genre.genres = mwg.genres 
AND 
    max_scores_per_genre.max_score = mwg.adjusted_imdb_score
ORDER BY 
    mwg.genres;
    
--  Find Genres with an Average IMDb Score Above the Overall Average IMDb Score and Include the Count of Movies in Each Genre

WITH AvgIMDBScore AS (
    SELECT 
        AVG(imdb_score) AS overall_avg_score 
    FROM 
        titles
),
GenreStats AS (
    SELECT 
        genres,
        AVG(imdb_score) AS avg_genre_score,
        COUNT(*) AS movie_count
    FROM 
        titles
    GROUP BY 
        genres
    HAVING 
        AVG(imdb_score) > (SELECT overall_avg_score FROM AvgIMDBScore)
)
SELECT 
    gs.genres,
    gs.avg_genre_score,
    gs.movie_count,
    (SELECT COUNT(*) FROM titles t WHERE t.genres = gs.genres) AS total_movies_in_genre
FROM 
    GenreStats gs
ORDER BY 
    gs.avg_genre_score DESC;




