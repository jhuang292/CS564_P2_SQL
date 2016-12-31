DROP VIEW IF EXISTS nonholiday_sale;
CREATE VIEW nonholiday_sale AS
    SELECT SUM(a.WeeklySales) as sale
    FROM Salesnew as a
    JOIN Holidays as h ON a.WeekDate = h.WeekDate
    WHERE h.IsHoliday = 'FALSE'
    GROUP BY a.WeekDate;

DROP VIEW IF EXISTS holiday_sale;
CREATE VIEW holiday_sale AS
    SELECT SUM(a.WeeklySales) as sum
    FROM Salesnew as a
    JOIN Holidays as h ON a.WeekDate = h.WeekDate
    WHERE h.IsHoliday = 'TRUE'
    GROUP BY a.WeekDate;

DROP VIEW IF EXISTS avg_holiday_sale;
CREATE VIEW avg_holiday_sale AS
    SELECT AVG(hs.sum) as avg
    FROM holiday_sale as hs;

SELECT COUNT(*)
FROM nonholiday_sale as ns, avg_holiday_sale as a
WHERE ns.sale > a.avg;

DROP VIEW IF EXISTS nonholiday_sale;
DROP VIEW IF EXISTS holiday_sale;
DROP VIEW IF EXISTS avg_holiday_sale;
