DROP VIEW IF EXISTS male_actor;
CREATE VIEW male_actor AS
    SELECT a.id
    FROM actor as a
    WHERE a.gender = 'M';

DROP VIEW IF EXISTS movie_with_male_actor;
CREATE VIEW movie_with_male_actor AS
    SELECT m.year, m.id
    FROM movie as m
    JOIN casts as c ON c.mid = m.id
    JOIN male_actor as a ON c.pid = a.id;

DROP VIEW IF EXISTS movie_without_male_actor;
CREATE VIEW movie_without_male_actor AS
    SELECT m.year, m.id
    FROM movie as m
    EXCEPT
    SELECT *
    FROM movie_with_male_actor;

-- SELECT m.year, count(*)
-- FROM movie_without_male_actor as mf
    -- JOIN movie as m ON mf.id = m.id
-- GROUP BY m.year;
select m.year, count(*) as count
from movie_without_male_actor as m
GROUP BY m.year;

DROP VIEW IF EXISTS male_actor;
DROP VIEW IF EXISTS movie_with_male_actor;
DROP VIEW IF EXISTS movie_without_male_actor;
