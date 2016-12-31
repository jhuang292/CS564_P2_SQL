DROP VIEW IF EXISTS movie_in_2010;
CREATE VIEW movie_in_2010 AS
    SELECT id
    FROM movie
    WHERE year = 2010;

DROP VIEW IF EXISTS pid_movie_count;
CREATE VIEW pid_movie_count AS
SELECT t.pid, COUNT(t.mid) as count
FROM(
    SELECT DISTINCT c.pid, m.id as mid
    FROM movie_in_2010 as m JOIN casts as c ON m.id = c.mid) as t
GROUP BY t.pid;

DROP VIEW IF EXISTS pid_movie_more_than_10;
CREATE VIEW pid_movie_more_than_10 AS
    SELECT *
    FROM pid_movie_count
    WHERE count >= 10;

DROP VIEW IF EXISTS actor_with_movie_more_than_10;
CREATE VIEW actor_with_movie_more_than_10 AS
    SELECT a.fname, a.lname
    FROM pid_movie_more_than_10 as t JOIN actor as a ON t.pid = a.id;

SELECT * FROM actor_with_movie_more_than_10;

DROP VIEW IF EXISTS movie_in_2010;
DROP VIEW IF EXISTS pid_movie_count;
DROP VIEW IF EXISTS pid_movie_more_than_10;
DROP VIEW IF EXISTS actor_with_movie_more_than_10;
