BEGIN;

DROP FUNCTION IF EXISTS gd_version();
DROP FUNCTION IF EXISTS gd_time_zone();
DROP FUNCTION IF EXISTS gd_week_start();

DROP FUNCTION IF EXISTS gd_second(timestamptz);
DROP FUNCTION IF EXISTS gd_second(timestamp);

DROP FUNCTION IF EXISTS gd_minute(timestamptz);
DROP FUNCTION IF EXISTS gd_minute(timestamp);

DROP FUNCTION IF EXISTS gd_hour(timestamptz);
DROP FUNCTION IF EXISTS gd_hour(timestamp);

DROP FUNCTION IF EXISTS gd_day(timestamptz);
DROP FUNCTION IF EXISTS gd_day(timestamp);
DROP FUNCTION IF EXISTS gd_day(date);
DROP FUNCTION IF EXISTS gd_day(timestamptz, text);
DROP FUNCTION IF EXISTS gd_day(timestamp, text);
DROP FUNCTION IF EXISTS gd_day(date, text);

DROP FUNCTION IF EXISTS gd_week(timestamptz);
DROP FUNCTION IF EXISTS gd_week(timestamp);
DROP FUNCTION IF EXISTS gd_week(date);
DROP FUNCTION IF EXISTS gd_week(timestamptz, text);
DROP FUNCTION IF EXISTS gd_week(timestamp, text);
DROP FUNCTION IF EXISTS gd_week(date, text);

DROP FUNCTION IF EXISTS gd_week_mon(timestamptz);
DROP FUNCTION IF EXISTS gd_week_mon(timestamp);
DROP FUNCTION IF EXISTS gd_week_mon(timestamptz, text);
DROP FUNCTION IF EXISTS gd_week_mon(timestamp, text);

DROP FUNCTION IF EXISTS gd_month(timestamptz);
DROP FUNCTION IF EXISTS gd_month(timestamp);
DROP FUNCTION IF EXISTS gd_month(date);
DROP FUNCTION IF EXISTS gd_month(timestamptz, text);
DROP FUNCTION IF EXISTS gd_month(timestamp, text);
DROP FUNCTION IF EXISTS gd_month(date, text);

DROP FUNCTION IF EXISTS gd_year(timestamptz);
DROP FUNCTION IF EXISTS gd_year(timestamp);
DROP FUNCTION IF EXISTS gd_year(date);
DROP FUNCTION IF EXISTS gd_year(timestamptz, text);
DROP FUNCTION IF EXISTS gd_year(timestamp, text);
DROP FUNCTION IF EXISTS gd_year(date, text);

DROP FUNCTION IF EXISTS gd_hour_of_day(timestamptz);
DROP FUNCTION IF EXISTS gd_hour_of_day(timestamp);
DROP FUNCTION IF EXISTS gd_hour_of_day(timestamptz, text);
DROP FUNCTION IF EXISTS gd_hour_of_day(timestamp, text);

DROP FUNCTION IF EXISTS gd_day_of_week(timestamptz);
DROP FUNCTION IF EXISTS gd_day_of_week(timestamp);
DROP FUNCTION IF EXISTS gd_day_of_week(date);
DROP FUNCTION IF EXISTS gd_day_of_week(timestamptz, text);
DROP FUNCTION IF EXISTS gd_day_of_week(timestamp, text);
DROP FUNCTION IF EXISTS gd_day_of_week(date, text);

DROP FUNCTION IF EXISTS gd_period(text, timestamptz);
DROP FUNCTION IF EXISTS gd_period(text, timestamp);
DROP FUNCTION IF EXISTS gd_period(text, date);
DROP FUNCTION IF EXISTS gd_period(text, timestamp, text);
DROP FUNCTION IF EXISTS gd_period(text, timestamptz, text);
DROP FUNCTION IF EXISTS gd_period(text, date, text);

COMMIT;
