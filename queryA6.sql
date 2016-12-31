DROP VIEW IF EXISTS store_year;
CREATE VIEW store_year AS
    SELECT DISTINCT Store, SUBSTR(Weekdate, 1, 4) as year
    FROM Salesnew;

DROP VIEW IF EXISTS bad_store_year;
CREATE VIEW bad_store_year AS
SELECT Store, SUBSTR(ymonth, 1, 4) AS year
FROM (
    SELECT DISTINCT Store, Dept, SUBSTR(Weekdate, 1, 7) as ymonth
    FROM Salesnew
    GROUP BY Store, Dept, ymonth
)
GROUP BY Store, Dept, year
HAVING COUNT(*) < 12;

SELECT * 
FROM store_year 
EXCEPT 
SELECT *
FROM bad_store_year;

DROP VIEW IF EXISTS store_year;
DROP VIEW IF EXISTS bad_store_year;
