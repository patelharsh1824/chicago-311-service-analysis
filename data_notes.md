# Data Notes: Chicago 311 Service Analysis

## About the data
- Source: Chicago Data Portal, 311 Service Requests (dataset ID `v6vf-nfxy`)
- Slice used: 2025 requests for three types: potholes, graffiti removal, rodent baiting
- 181,673 rows in the raw file (about 69 MB, kept out of GitHub with `.gitignore`)
- Wait time = closed date minus created date, in days

## Problems found

- **34,177 requests closed in under 1 minute**: graffiti 30,457 and potholes 3,718. Real repairs cannot happen that fast.
- **City-entered records distort the numbers.** The origins "Mass Entry" and "Generated In House" (33,461 rows) are created by the city, not by residents. About 30,407 of the instant closures are "Mass Entry" graffiti records.
- **Repeat reports exist** (duplicate flag), especially for potholes.
- **2,276 pothole requests made by phone call closed in under 1 minute.** Reason unknown.

## Cleaning decisions

1. **Excluded origins "Mass Entry" and "Generated In House"** (33,461 rows). They are city-entered and do not represent a resident waiting for a fix. The cleaned table is `requests_clean` (148,212 rows).
2. **Kept the 2,276 pothole phone-call requests** that closed in under 1 minute, for now. The reason is unknown and still to investigate.
3. **Repeat reports:** kept in the database but excluded from the main wait-time numbers (see "Repeat reports" below).

## First look: average wait (days)

| Request type | Raw data | After cleaning |
|---|---|---|
| Graffiti | 1.52 | 2.25 |
| Rodent | 4.69 | 4.69 |
| Pothole | 34.31 | 36.59 |

Cleaning mattered most for graffiti, because the instant city-entered closures were pulling its average down.

## Average vs median (cleaned data)

Averages are pulled up by a small group of very long waits, so the median (the middle wait) is a fairer "typical" number.

| Request type | Median wait (days) |
|---|---|
| Pothole | 14.87 |
| Rodent | 3.68 |
| Graffiti | 0.97 |

Potholes: average 36.59 days vs median 14.87 days.

## Repeat reports (duplicates)

After cleaning, 21,274 of 148,212 requests are flagged as repeat reports (duplicate = TRUE).

| Request type | First reports | Repeat reports | Avg wait, first (days) | Avg wait, repeat (days) |
|---|---|---|---|---|
| Graffiti | 58,628 | 3,943 | 2.29 | 1.67 |
| Pothole | 25,257 | 16,233 | 29.86 | 47.05 |
| Rodent | 43,053 | 1,098 | 4.70 | 4.30 |

**Decision:** the main wait-time numbers use first reports only (duplicate = FALSE), so each problem counts once. Repeat reports stay in the database and are analyzed separately.

**Finding:** about 39% of pothole requests are repeat reports, and they wait much longer than first reports (47 vs 30 days). This may mean unfixed potholes get reported again and again, but the data does not prove that.

**Open question:** how the city sets the duplicate flag. To check in the data dictionary.