DROP VIEW IF EXISTS type_sales;
CREATE VIEW type_sales AS
    SELECT s.Type, SUBSTR(a.WeekDate, 6, 2) as month, SUM(a.WeeklySales) as sum
    FROM Stores as s
    JOIN Salesnew as a ON s.Store = a.Store
    GROUP BY s.Type, month;

SELECT *
FROM type_sales;

DROP VIEW IF EXISTS type_sales;
