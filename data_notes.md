# \# Data Notes

# 

# Chicago 311 service requests, 2025, completed only: potholes, graffiti, rodent complaints. 181,673 rows, 39 columns.

# 

# \## Problems found

# \- 21,353 rows are marked duplicate (repeat reports of the same problem), mostly potholes. Excluding them changes the pothole median from 12.9 to 7.0 days, so the choice must be explained.

# \- 34,177 requests were closed in under 1 minute. Almost all graffiti (30,457) and some potholes (3,718).

# \- 44 requests took over 365 days to close (longest 554 days). These outliers distort averages, so use medians.

# \- zip\_code is blank in 28.6% of rows. Use ward or community\_area for area analysis instead (missing in only 0.3%).

# \- created\_department is blank in 70% of rows. Not used.

# 

# \## Cleaning decisions

# 1\. \*\*Excluded origins "Mass Entry" and "Generated In House" (33,461 rows).\*\* 30,407 of the 30,457 instant graffiti closures have origin Mass Entry. The city's column description says these origins come from the city's own operations, so they appear to be city-entered records, not residents waiting for a fix. Including them made graffiti look faster than residents experience it (average 1.52 days with them, 2.25 without). The cleaned data is the table requests\_clean (148,212 rows). The raw table is untouched.

# 2\. \*\*Repeat reports: kept for now.\*\* Decision pending. For potholes, repeats average 47 days against 27 for originals, so the choice matters.

# 3\. \*\*Pothole phone calls closed in under 1 minute (2,276 rows): kept for now.\*\* Reason unknown. To be investigated.

# 

# \## First look (average days to resolve)

# | Type | Raw data | After cleaning (decision 1) |

# |---|---|---|

# | Graffiti | 1.52 | 2.25 |

# | Rodent | 4.69 | 4.69 |

# | Pothole | 34.31 | 36.59 |

