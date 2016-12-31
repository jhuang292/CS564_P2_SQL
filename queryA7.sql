DROP VIEW IF EXISTS sales_vs_other;
CREATE VIEW sales_vs_other AS
    SELECT a.WeeklySales, t.Temperature, t.FuelPrice, t.CPI, t.UnemploymentRate
    FROM Salesnew as a
    JOIN TemporalData as t ON a.Store = t.Store AND a.WeekDate = t.WeekDate;

DROP VIEW IF EXISTS averages;
CREATE VIEW averages AS
SELECT AVG(WeeklySales) as w, 
    AVG(Temperature) as t, 
    AVG(FuelPrice) as f, 
    AVG(CPI) as c,
    AVG(UnemploymentRate) as u
FROM sales_vs_other;

-- drop table if exists mytable;
-- create table mytable(AttributeName varchar(20), CorrelationSign Integer);
-- insert into mytable
-- select *
-- from (
SELECT col as AttributeName2, CAST(ROUND(sum/ABS(sum)) as integer) as CorrelationSign
FROM(
    SELECT 'Temperature' as col, SUM((s.WeeklySales - a.w)*(s.Temperature - a.t)) as sum
    FROM sales_vs_other as s, averages as a
    UNION
    SELECT 'FuelPrice' as col, SUM((s.WeeklySales - a.w)*(s.FuelPrice - a.f)) as sum
    FROM sales_vs_other as s, averages as a
    UNION
    SELECT 'CPI' as col, SUM((s.WeeklySales - a.w)*(s.CPI - a.c)) as sum
    FROM sales_vs_other as s, averages as a
    UNION
    SELECT 'UnemploymentRate' as col, SUM((s.WeeklySales - a.w)*(s.UnemploymentRate - a.u)) as sum
    FROM sales_vs_other as s, averages as a);

DROP VIEW IF EXISTS sales_vs_other;
DROP VIEW IF EXISTS averages;
