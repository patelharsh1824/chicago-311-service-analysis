WITH ranked AS (
  SELECT sr_type, days_to_close,
         ROW_NUMBER() OVER (PARTITION BY sr_type ORDER BY days_to_close) AS rn,
         COUNT(*) OVER (PARTITION BY sr_type) AS n
  FROM requests_clean
)
SELECT sr_type,
       COUNT(*) AS rows_used,
       ROUND(AVG(days_to_close), 2) AS median_days
FROM ranked
WHERE rn IN ((n + 1) / 2, (n + 2) / 2)
GROUP BY sr_type
ORDER BY median_days DESC;	