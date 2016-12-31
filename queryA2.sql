-- not normalized
DROP VIEW IF EXISTS dep_sale;
CREATE VIEW dep_sale AS
    SELECT s.Size, a.Dept, a.WeeklySales
    FROM Salesnew as a
    JOIN Stores as s ON a.Store = s.Store;

DROP VIEW IF EXISTS dep_nsale;
CREATE VIEW dep_nsale AS
SELECT ds.Dept, SUM(ds.WeeklySales / ds.Size) as nsale
FROM dep_sale AS ds
GROUP BY ds.Dept;

SELECT *
FROM dep_nsale as d
ORDER BY d.nsale DESC
LIMIT 20;

DROP VIEW IF EXISTS dep_sale;
DROP VIEW IF EXISTS dep_nsale;
