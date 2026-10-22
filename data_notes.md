# Data Notes

Chicago 311 service requests, 2025, completed only: potholes, graffiti, rodent complaints. 181,673 rows, 39 columns.

## Problems found
- 21,353 rows are marked duplicate (repeat reports of the same problem), mostly potholes. Excluding them changes the pothole median from 12.9 to 7.0 days, so the choice must be explained.
- 34,099 requests were closed in under 1 minute. Possibly automatic closures. Need to check before trusting averages.
- 44 requests took over 365 days to close (longest 554 days). These outliers distort averages, so use medians.
- zip_code is blank in 28.6% of rows. Use ward or community_area for area analysis instead (missing in only 0.3%).
- created_department is blank in 70% of rows. Not used.

## First look (median days to resolve)
- Graffiti: 0.7
- Rodent: 3.7
- Pothole: 12.9 (90th percentile: 104 days)
