DROP VIEW IF EXISTS movie_years;
CREATE VIEW movie_years AS
    SELECT m.year, COUNT(*) as count
    FROM movie as m
    GROUP BY m.year;

DROP VIEW IF EXISTS decades;
CREATE VIEW decades AS
    SELECT y1.year, y2.count
    FROM movie_years as y1, movie_years as y2
    WHERE y2.year >= y1.year AND y2.year <= y1.year + 9;

DROP VIEW IF EXISTS decade_counts;
CREATE VIEW decade_counts AS
    SELECT year, SUM(count) as count
    FROM decades
    GROUP BY year;

SELECT year
FROM decade_counts
ORDER BY count DESC
LIMIT 1;

DROP VIEW IF EXISTS movie_years;
DROP VIEW IF EXISTS decades;
DROP VIEW IF EXISTS decade_counts;
