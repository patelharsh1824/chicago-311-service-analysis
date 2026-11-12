SELECT sr_type,
       COUNT(*) AS total,
       ROUND(AVG(julianday(closed_date) - julianday(created_date)), 2) AS avg_days
FROM requests
GROUP BY sr_type
ORDER BY avg_days DESC;