SELECT s.Store
FROM Stores as s
WHERE EXISTS (
    SELECT *
    FROM Stores s2
    JOIN TemporalData as t ON s2.Store = t.Store
    WHERE s2.Store = s.Store
        AND t.UnemploymentRate > 10
) AND NOT EXISTS (
    SELECT *
    FROM Stores s2
    JOIN TemporalData as t ON s2.Store = t.Store
    WHERE s2.Store = s.Store
        AND t.FuelPrice >= 4
);
