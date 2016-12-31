DROP VIEW IF EXISTS store_holiday_sale;
CREATE VIEW store_holiday_sale AS
    SELECT s.Store, SUM(a.WeeklySales) as sale
    FROM Stores as s
    JOIN Salesnew as a ON s.Store = a.Store
    JOIN Holidays as h ON a.WeekDate = h.WeekDate
    WHERE h.IsHoliday = 'TRUE'
    GROUP BY s.Store;

SELECT *
FROM (SELECT *
    FROM store_holiday_sale
    ORDER BY sale DESC
    LIMIT 1)
UNION ALL
SELECT *
FROM (SELECT *
    FROM store_holiday_sale
    ORDER BY sale ASC
    LIMIT 1)
;

DROP VIEW IF EXISTS store_holiday_sale;
