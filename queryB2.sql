DROP VIEW IF EXISTS name_of_directors_movie_in_2000;
CREATE VIEW name_of_directors_movie_in_2000 AS
    SELECT DISTINCT d.fname, d.lname, m.id as mid
    FROM movie as m 
        JOIN movie_directors as md ON m.id = md.mid
        JOIN directors as d ON md.did = d.id
    WHERE m.year = 2000;


DROP VIEW IF EXISTS name_of_actors_of_movie_in_2000;
CREATE VIEW name_of_actors_of_movie_in_2000 AS
    SELECT DISTINCT a.fname, a.lname, m.id as mid
    FROM movie as m 
        JOIN casts as c ON m.id = c.mid
        JOIN actor as a ON c.pid = a.id
    where m.year = 2000;

SELECT a.fname, a.lname, d.fname, d.lname
FROM name_of_directors_movie_in_2000 as d
    JOIN name_of_actors_of_movie_in_2000 as a ON d.mid = a.mid
WHERE a.fname = d.fname AND a.lname = d.lname;

-- WHERE REPLACE(a.fname, ' ', '') = REPLACE(d.fname, ' ', '')
-- AND REPLACE(a.lname, ' ', '') = REPLACE(d.lname, ' ', '')
-- GROUP BY a.fname, a.lname;

DROP VIEW IF EXISTS name_of_directors_movie_in_2000;
DROP VIEW IF EXISTS name_of_actors_of_movie_in_2000;
