CREATE TABLE requests_clean AS
SELECT sr_number, sr_type, origin, duplicate,
       created_date, closed_date,
       ward, community_area, zip_code, latitude, longitude,
       created_month, created_day_of_week, created_hour,
       ROUND(julianday(closed_date) - julianday(created_date), 4) AS days_to_close
FROM requests
WHERE origin NOT IN ('Mass Entry', 'Generated In House');