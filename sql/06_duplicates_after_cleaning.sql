SELECT sr_type,
       duplicate,
       COUNT(*) AS total,
       ROUND(AVG(days_to_close), 2) AS avg_days
FROM requests_clean
GROUP BY sr_type, duplicate
ORDER BY sr_type, duplicate;