DROP VIEW IF EXISTS bacon_movie;
CREATE VIEW bacon_movie AS
    SELECT c.mid as id
    FROM actor as a
        JOIN casts as c ON a.id = c.pid
    WHERE a.fname = 'Kevin' AND a.lname = 'Bacon';

DROP VIEW IF EXISTS bacon_one;
CREATE VIEW bacon_one AS
    SELECT distinct a.id
    FROM bacon_movie as m
        JOIN casts as c on m.id = c.mid
        JOIN actor as a on c.pid = a.id;

DROP VIEW IF EXISTS bacon_one_movie;
CREATE VIEW bacon_one_movie AS
    SELECT c.mid as id
    FROM bacon_one as a
        JOIN casts as c ON a.id = c.pid;

DROP VIEW IF EXISTS bacon_two;
CREATE VIEW bacon_two AS
    SELECT distinct a.id
    FROM bacon_one_movie as m
        JOIN casts as c on m.id = c.mid
        JOIN actor as a on c.pid = a.id;

SELECT b2.count - b1.count
FROM (
    SELECT COUNT(*) as count FROM bacon_two
) as b2, (
    SELECT COUNT(*) as count FROM bacon_one
) as b1;
-- SELECT COUNT(*)
-- FROM(
    -- SELECT b2.id
    -- FROM bacon_two as b2
    -- EXCEPT
    -- SELECT b1.id
    -- FROM bacon_one as b1
-- );

DROP VIEW IF EXISTS bacon_movie;
DROP VIEW IF EXISTS bacon_one;
DROP VIEW IF EXISTS bacon_one_movie;
DROP VIEW IF EXISTS bacon_two;
