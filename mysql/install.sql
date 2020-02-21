START TRANSACTION;

-- version

DROP FUNCTION IF EXISTS gd_version;
CREATE FUNCTION gd_version()
  RETURNS VARCHAR(255)
  RETURN '2.0.2';


-- default week start

DROP FUNCTION IF EXISTS gd_week_start;
CREATE FUNCTION gd_week_start()
  RETURNS INT
  RETURN 6; -- mon=0, tue=1, wed=2, thu=3, fri=4, sat=5, sun=6


-- second

DROP FUNCTION IF EXISTS gd_second;
CREATE FUNCTION gd_second(ts TIMESTAMP, time_zone VARCHAR(255))
  RETURNS TIMESTAMP
  RETURN CONVERT_TZ(DATE_FORMAT(CONVERT_TZ(ts, '+00:00', time_zone), '%Y-%m-%d %H:%i:%S'), time_zone, '+00:00');


-- minute

DROP FUNCTION IF EXISTS gd_minute;
CREATE FUNCTION gd_minute(ts TIMESTAMP, time_zone VARCHAR(255))
  RETURNS TIMESTAMP
  RETURN CONVERT_TZ(DATE_FORMAT(CONVERT_TZ(ts, '+00:00', time_zone), '%Y-%m-%d %H:%i:00'), time_zone, '+00:00');


-- hour

DROP FUNCTION IF EXISTS gd_hour;
CREATE FUNCTION gd_hour(ts TIMESTAMP, time_zone VARCHAR(255))
  RETURNS TIMESTAMP
  RETURN CONVERT_TZ(DATE_FORMAT(CONVERT_TZ(ts, '+00:00', time_zone), '%Y-%m-%d %H:00:00'), time_zone, '+00:00');


-- day

DROP FUNCTION IF EXISTS gd_day;
CREATE FUNCTION gd_day(ts TIMESTAMP, time_zone VARCHAR(255))
  RETURNS DATE
  RETURN DATE_FORMAT(CONVERT_TZ(ts, '+00:00', time_zone), '%Y-%m-%d 00:00:00');


-- week

DROP FUNCTION IF EXISTS gd_week;
CREATE FUNCTION gd_week(ts TIMESTAMP, time_zone VARCHAR(255))
  RETURNS DATE
  RETURN DATE_FORMAT(CONVERT_TZ(DATE_SUB(ts, INTERVAL ((7 - gd_week_start() + WEEKDAY(CONVERT_TZ(ts, '+00:00', time_zone))) % 7) DAY), '+00:00', time_zone), '%Y-%m-%d 00:00:00');


-- month

DROP FUNCTION IF EXISTS gd_month;
CREATE FUNCTION gd_month(ts TIMESTAMP, time_zone VARCHAR(255))
  RETURNS DATE
  RETURN DATE_FORMAT(CONVERT_TZ(ts, '+00:00', time_zone), '%Y-%m-01 00:00:00');


-- quarter

DROP FUNCTION IF EXISTS gd_quarter;
CREATE FUNCTION gd_quarter(ts TIMESTAMP, time_zone VARCHAR(255))
  RETURNS DATE
  RETURN DATE_FORMAT(DATE(CONCAT(YEAR(CONVERT_TZ(ts, '+00:00', time_zone)), '-', LPAD(1 + 3 * (QUARTER(CONVERT_TZ(ts, '+00:00', time_zone)) - 1), 2, '00'), '-01')), '%Y-%m-%d %H:%i:%S');

-- year

DROP FUNCTION IF EXISTS gd_year;
CREATE FUNCTION gd_year(ts TIMESTAMP, time_zone VARCHAR(255))
  RETURNS DATE
  RETURN DATE_FORMAT(CONVERT_TZ(ts, '+00:00', time_zone), '%Y-01-01 00:00:00');


-- hour of day

DROP FUNCTION IF EXISTS gd_hour_of_day;
CREATE FUNCTION gd_hour_of_day(ts TIMESTAMP, time_zone VARCHAR(255))
  RETURNS INT
  RETURN EXTRACT(HOUR FROM CONVERT_TZ(ts, '+00:00', time_zone));


-- day of week

DROP FUNCTION IF EXISTS gd_day_of_week;
CREATE FUNCTION gd_day_of_week(ts TIMESTAMP, time_zone VARCHAR(255))
  RETURNS INT
  RETURN DAYOFWEEK(CONVERT_TZ(ts, '+00:00', time_zone)) - 1;


-- day of month

DROP FUNCTION IF EXISTS gd_day_of_month;
CREATE FUNCTION gd_day_of_month(ts TIMESTAMP, time_zone VARCHAR(255))
  RETURNS INT
  RETURN DAYOFMONTH(CONVERT_TZ(ts, '+00:00', time_zone));


-- day of year

DROP FUNCTION IF EXISTS gd_day_of_year;
CREATE FUNCTION gd_day_of_year(ts TIMESTAMP, time_zone VARCHAR(255))
  RETURNS INT
  RETURN DAYOFYEAR(CONVERT_TZ(ts, '+00:00', time_zone));


-- month of year

DROP FUNCTION IF EXISTS gd_month_of_year;
CREATE FUNCTION gd_month_of_year(ts TIMESTAMP, time_zone VARCHAR(255))
  RETURNS INT
  RETURN MONTH(CONVERT_TZ(ts, '+00:00', time_zone));


-- period

DROP FUNCTION IF EXISTS gd_period;
CREATE FUNCTION gd_period(period VARCHAR(255), ts TIMESTAMP, time_zone VARCHAR(255))
  RETURNS DATE
  RETURN CASE
  WHEN period = 'day' THEN
    gd_day(ts, time_zone)
  WHEN period = 'week' THEN
    gd_week(ts, time_zone)
  WHEN period = 'month' THEN
    gd_month(ts, time_zone)
  WHEN period = 'quarter' THEN
    gd_quarter(ts, time_zone)
  WHEN period = 'year' THEN
    gd_year(ts, time_zone)
  ELSE
    NULL
  END;


COMMIT;
