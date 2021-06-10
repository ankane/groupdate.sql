## 2.2.1 (unreleased)

- Marked some functions as `NO SQL` instead of `DETERMINISTIC` for MySQL

## 2.2.0 (2021-06-10)

- Marked functions as `DETERMINISTIC` for MySQL

## 2.1.0 (2020-02-20)

- Fixed bug with `gd_day`, `gd_week`, `gd_month`, and `gd_year` returning the wrong date for positive UTC offsets in MySQL
- Added `gd_quarter`

## 2.0.2 (2019-10-28)

- Added `gd_day_of_year`

## 2.0.1 (2019-08-30)

- Added `gd_day_of_month` and `gd_month_of_year`

## 2.0.0 (2018-07-08)

- Added `gd_period` function
- Added support for week start
- Added support for dates and default time zone in PostgreSQL

Breaking

- `gd_day`, `gd_week`, `gd_month`, and `gd_year` functions now return dates instead of times
- Removed `gd_week_mon`

## 1.0.0

- First release
