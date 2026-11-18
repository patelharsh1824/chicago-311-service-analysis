SELECT sr_type,
       origin,
       COUNT(*) AS closed_under_1_min
FROM requests
WHERE (julianday(closed_date) - julianday(created_date)) * 1440 < 1
GROUP BY sr_type, origin
ORDER BY closed_under_1_min DESC;