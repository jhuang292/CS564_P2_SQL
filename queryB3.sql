DROP VIEW IF EXISTS movie_1990_2010;
CREATE VIEW movie_1990_2010 AS
    SELECT id
    FROM movie
    WHERE year >= 1990 AND year <= 2010;

DROP VIEW IF EXISTS did_movie_count;
CREATE VIEW did_movie_count AS
    SELECT d.did, COUNT(mid) as count
    FROM movie_1990_2010 as m JOIN movie_directors as d ON m.id = d.mid
    GROUP BY d.did;

SELECT d.fname, d.lname, dm.count
FROM directors as d
    JOIN did_movie_count as dm ON d.id = dm.did
ORDER BY dm.count DESC
LIMIT 100;

DROP VIEW IF EXISTS movie_1990_2010;
DROP VIEW IF EXISTS did_movie_count;
