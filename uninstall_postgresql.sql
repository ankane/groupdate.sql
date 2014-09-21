BEGIN;

DROP FUNCTION IF EXISTS gd_version();

DROP FUNCTION IF EXISTS gd_second(timestamptz);
DROP FUNCTION IF EXISTS gd_second(timestamp);

DROP FUNCTION IF EXISTS gd_minute(timestamptz);
DROP FUNCTION IF EXISTS gd_minute(timestamp);

DROP FUNCTION IF EXISTS gd_hour(timestamptz);
DROP FUNCTION IF EXISTS gd_hour(timestamp);

DROP FUNCTION IF EXISTS gd_day(timestamptz);
DROP FUNCTION IF EXISTS gd_day(timestamp);
DROP FUNCTION IF EXISTS gd_day(timestamptz, text);
DROP FUNCTION IF EXISTS gd_day(timestamp, text);

DROP FUNCTION IF EXISTS gd_week(timestamptz);
DROP FUNCTION IF EXISTS gd_week(timestamp);
DROP FUNCTION IF EXISTS gd_week(timestamptz, text);
DROP FUNCTION IF EXISTS gd_week(timestamp, text);

DROP FUNCTION IF EXISTS gd_month(timestamptz);
DROP FUNCTION IF EXISTS gd_month(timestamp);
DROP FUNCTION IF EXISTS gd_month(timestamptz, text);
DROP FUNCTION IF EXISTS gd_month(timestamp, text);

DROP FUNCTION IF EXISTS gd_year(timestamptz);
DROP FUNCTION IF EXISTS gd_year(timestamp);
DROP FUNCTION IF EXISTS gd_year(timestamptz, text);
DROP FUNCTION IF EXISTS gd_year(timestamp, text);

DROP FUNCTION IF EXISTS gd_hour_of_day(timestamptz);
DROP FUNCTION IF EXISTS gd_hour_of_day(timestamp);
DROP FUNCTION IF EXISTS gd_hour_of_day(timestamptz, text);
DROP FUNCTION IF EXISTS gd_hour_of_day(timestamp, text);

DROP FUNCTION IF EXISTS gd_day_of_week(timestamptz);
DROP FUNCTION IF EXISTS gd_day_of_week(timestamp);
DROP FUNCTION IF EXISTS gd_day_of_week(timestamptz, text);
DROP FUNCTION IF EXISTS gd_day_of_week(timestamp, text);

COMMIT;
