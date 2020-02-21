BEGIN;

-- version

CREATE OR REPLACE FUNCTION gd_version()
  RETURNS text AS
$$
  SELECT '2.0.2'::text;
$$
  LANGUAGE SQL IMMUTABLE;


-- default time zone

CREATE OR REPLACE FUNCTION gd_time_zone()
  RETURNS text AS
$$
  SELECT 'Etc/UTC'::text;
$$
  LANGUAGE SQL IMMUTABLE;


-- default week start

CREATE OR REPLACE FUNCTION gd_week_start()
  RETURNS int AS
$$
  SELECT 6; -- mon=0, tue=1, wed=2, thu=3, fri=4, sat=5, sun=6
$$
  LANGUAGE SQL IMMUTABLE;


-- second

CREATE OR REPLACE FUNCTION gd_second(timestamptz)
  RETURNS timestamptz AS
$$
  SELECT DATE_TRUNC('second', $1)::timestamptz;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_second(timestamp)
  RETURNS timestamptz AS
$$
  SELECT gd_second($1::timestamptz);
$$
  LANGUAGE SQL STABLE;


-- minute

CREATE OR REPLACE FUNCTION gd_minute(timestamptz)
  RETURNS timestamptz AS
$$
  SELECT DATE_TRUNC('minute', $1)::timestamptz;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_minute(timestamp)
  RETURNS timestamptz AS
$$
  SELECT gd_minute($1::timestamptz);
$$
  LANGUAGE SQL STABLE;


-- hour

CREATE OR REPLACE FUNCTION gd_hour(timestamptz)
  RETURNS timestamptz AS
$$
  SELECT DATE_TRUNC('hour', $1)::timestamptz;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_hour(timestamp)
  RETURNS timestamptz AS
$$
  SELECT gd_hour($1::timestamptz);
$$
  LANGUAGE SQL STABLE;


-- day

CREATE OR REPLACE FUNCTION gd_day(date)
  RETURNS date AS
$$
  SELECT $1;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_day(date, text)
  RETURNS date AS
$$
  SELECT gd_day($1);
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_day(timestamptz, text)
  RETURNS date AS
$$
  SELECT DATE_TRUNC('day', $1 AT TIME ZONE $2)::date;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_day(timestamp, text)
  RETURNS date AS
$$
  SELECT gd_day($1::timestamptz, $2);
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_day(timestamptz)
  RETURNS date AS
$$
  SELECT gd_day($1, gd_time_zone());
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_day(timestamp)
  RETURNS date AS
$$
  SELECT gd_day($1::timestamptz, gd_time_zone());
$$
  LANGUAGE SQL STABLE;


-- week

CREATE OR REPLACE FUNCTION gd_week(date)
  RETURNS date AS
$$
  SELECT (DATE_TRUNC('week', $1 - (gd_week_start() || ' day')::interval) + (gd_week_start() || ' day')::interval)::date;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_week(date, text)
  RETURNS date AS
$$
  SELECT gd_week($1);
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_week(timestamptz, text)
  RETURNS date AS
$$
  SELECT (DATE_TRUNC('week', ($1 - (gd_week_start() || ' day')::interval) AT TIME ZONE $2) + (gd_week_start() || ' day')::interval)::date;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_week(timestamp, text)
  RETURNS date AS
$$
  SELECT gd_week($1::timestamptz, $2);
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_week(timestamptz)
  RETURNS date AS
$$
  SELECT gd_week($1, gd_time_zone());
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_week(timestamp)
  RETURNS date AS
$$
  SELECT gd_week($1::timestamptz, gd_time_zone());
$$
  LANGUAGE SQL STABLE;


-- month

CREATE OR REPLACE FUNCTION gd_month(date)
  RETURNS date AS
$$
  SELECT DATE_TRUNC('month', $1)::date;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_month(date, text)
  RETURNS date AS
$$
  SELECT gd_month($1);
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_month(timestamptz, text)
  RETURNS date AS
$$
  SELECT DATE_TRUNC('month', $1 AT TIME ZONE $2)::date;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_month(timestamp, text)
  RETURNS date AS
$$
  SELECT gd_month($1::timestamptz, $2);
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_month(timestamptz)
  RETURNS date AS
$$
  SELECT gd_month($1, gd_time_zone());
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_month(timestamp)
  RETURNS date AS
$$
  SELECT gd_month($1::timestamptz, gd_time_zone());
$$
  LANGUAGE SQL STABLE;


-- quarter

CREATE OR REPLACE FUNCTION gd_quarter(date)
  RETURNS date AS
$$
  SELECT DATE_TRUNC('quarter', $1)::date;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_quarter(date, text)
  RETURNS date AS
$$
  SELECT gd_quarter($1);
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_quarter(timestamptz, text)
  RETURNS date AS
$$
  SELECT DATE_TRUNC('quarter', $1 AT TIME ZONE $2)::date;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_quarter(timestamp, text)
  RETURNS date AS
$$
  SELECT gd_quarter($1::timestamptz, $2);
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_quarter(timestamptz)
  RETURNS date AS
$$
  SELECT gd_quarter($1, gd_time_zone());
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_quarter(timestamp)
  RETURNS date AS
$$
  SELECT gd_quarter($1::timestamptz, gd_time_zone());
$$
  LANGUAGE SQL STABLE;


-- year

CREATE OR REPLACE FUNCTION gd_year(date)
  RETURNS date AS
$$
  SELECT DATE_TRUNC('year', $1)::date;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_year(date, text)
  RETURNS date AS
$$
  SELECT gd_year($1);
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_year(timestamptz, text)
  RETURNS date AS
$$
  SELECT DATE_TRUNC('year', $1 AT TIME ZONE $2)::date;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_year(timestamp, text)
  RETURNS date AS
$$
  SELECT gd_year($1::timestamptz, $2);
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_year(timestamptz)
  RETURNS date AS
$$
  SELECT gd_year($1, gd_time_zone());
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_year(timestamp)
  RETURNS date AS
$$
  SELECT gd_year($1::timestamptz, gd_time_zone());
$$
  LANGUAGE SQL STABLE;


-- hour of day

CREATE OR REPLACE FUNCTION gd_hour_of_day(timestamptz, text)
  RETURNS integer AS
$$
  SELECT EXTRACT(HOUR FROM $1 AT TIME ZONE $2)::integer;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_hour_of_day(timestamp, text)
  RETURNS integer AS
$$
  SELECT gd_hour_of_day($1::timestamptz, $2);
$$
  LANGUAGE SQL STABLE;

CREATE OR REPLACE FUNCTION gd_hour_of_day(timestamptz)
  RETURNS integer AS
$$
  SELECT gd_hour_of_day($1, gd_time_zone());
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_hour_of_day(timestamp)
  RETURNS integer AS
$$
  SELECT gd_hour_of_day($1::timestamptz, gd_time_zone());
$$
  LANGUAGE SQL STABLE;


-- day of week

CREATE OR REPLACE FUNCTION gd_day_of_week(date)
  RETURNS integer AS
$$
  SELECT EXTRACT(DOW FROM $1)::integer;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_day_of_week(date, text)
  RETURNS integer AS
$$
  SELECT gd_day_of_week($1);
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_day_of_week(timestamptz, text)
  RETURNS integer AS
$$
  SELECT EXTRACT(DOW FROM $1 AT TIME ZONE $2)::integer;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_day_of_week(timestamp, text)
  RETURNS integer AS
$$
  SELECT gd_day_of_week($1::timestamptz, $2);
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_day_of_week(timestamptz)
  RETURNS integer AS
$$
  SELECT gd_day_of_week($1, gd_time_zone());
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_day_of_week(timestamp)
  RETURNS integer AS
$$
  SELECT gd_day_of_week($1::timestamptz, gd_time_zone());
$$
  LANGUAGE SQL STABLE;


-- day of month

CREATE OR REPLACE FUNCTION gd_day_of_month(date)
  RETURNS integer AS
$$
  SELECT EXTRACT(DAY FROM $1)::integer;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_day_of_month(date, text)
  RETURNS integer AS
$$
  SELECT gd_day_of_month($1);
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_day_of_month(timestamptz, text)
  RETURNS integer AS
$$
  SELECT EXTRACT(DAY FROM $1 AT TIME ZONE $2)::integer;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_day_of_month(timestamp, text)
  RETURNS integer AS
$$
  SELECT gd_day_of_month($1::timestamptz, $2);
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_day_of_month(timestamptz)
  RETURNS integer AS
$$
  SELECT gd_day_of_month($1, gd_time_zone());
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_day_of_month(timestamp)
  RETURNS integer AS
$$
  SELECT gd_day_of_month($1::timestamptz, gd_time_zone());
$$
  LANGUAGE SQL STABLE;


-- day of year

CREATE OR REPLACE FUNCTION gd_day_of_year(date)
  RETURNS integer AS
$$
  SELECT EXTRACT(DOY FROM $1)::integer;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_day_of_year(date, text)
  RETURNS integer AS
$$
  SELECT gd_day_of_year($1);
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_day_of_year(timestamptz, text)
  RETURNS integer AS
$$
  SELECT EXTRACT(DOY FROM $1 AT TIME ZONE $2)::integer;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_day_of_year(timestamp, text)
  RETURNS integer AS
$$
  SELECT gd_day_of_year($1::timestamptz, $2);
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_day_of_year(timestamptz)
  RETURNS integer AS
$$
  SELECT gd_day_of_year($1, gd_time_zone());
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_day_of_year(timestamp)
  RETURNS integer AS
$$
  SELECT gd_day_of_year($1::timestamptz, gd_time_zone());
$$
  LANGUAGE SQL STABLE;


-- month of year

CREATE OR REPLACE FUNCTION gd_month_of_year(date)
  RETURNS integer AS
$$
  SELECT EXTRACT(MONTH FROM $1)::integer;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_month_of_year(date, text)
  RETURNS integer AS
$$
  SELECT gd_month_of_year($1);
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_month_of_year(timestamptz, text)
  RETURNS integer AS
$$
  SELECT EXTRACT(MONTH FROM $1 AT TIME ZONE $2)::integer;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_month_of_year(timestamp, text)
  RETURNS integer AS
$$
  SELECT gd_month_of_year($1::timestamptz, $2);
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_month_of_year(timestamptz)
  RETURNS integer AS
$$
  SELECT gd_month_of_year($1, gd_time_zone());
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_month_of_year(timestamp)
  RETURNS integer AS
$$
  SELECT gd_month_of_year($1::timestamptz, gd_time_zone());
$$
  LANGUAGE SQL STABLE;


-- period

CREATE OR REPLACE FUNCTION gd_period(text, timestamp)
  RETURNS date AS
$$
  SELECT CASE
  WHEN $1 = 'day' THEN
    gd_day($2)
  WHEN $1 = 'week' THEN
    gd_week($2)
  WHEN $1 = 'month' THEN
    gd_month($2)
  WHEN $1 = 'quarter' THEN
    gd_quarter($2)
  WHEN $1 = 'year' THEN
    gd_year($2)
  ELSE
    NULL
  END;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_period(text, timestamptz)
  RETURNS date AS
$$
  SELECT CASE
  WHEN $1 = 'day' THEN
    gd_day($2)
  WHEN $1 = 'week' THEN
    gd_week($2)
  WHEN $1 = 'month' THEN
    gd_month($2)
  WHEN $1 = 'quarter' THEN
    gd_quarter($2)
  WHEN $1 = 'year' THEN
    gd_year($2)
  ELSE
    NULL
  END;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_period(text, date)
  RETURNS date AS
$$
  SELECT CASE
  WHEN $1 = 'day' THEN
    gd_day($2)
  WHEN $1 = 'week' THEN
    gd_week($2)
  WHEN $1 = 'month' THEN
    gd_month($2)
  WHEN $1 = 'quarter' THEN
    gd_quarter($2)
  WHEN $1 = 'year' THEN
    gd_year($2)
  ELSE
    NULL
  END;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_period(text, timestamp, text)
  RETURNS date AS
$$
  SELECT CASE
  WHEN $1 = 'day' THEN
    gd_day($2, $3)
  WHEN $1 = 'week' THEN
    gd_week($2, $3)
  WHEN $1 = 'month' THEN
    gd_month($2, $3)
  WHEN $1 = 'quarter' THEN
    gd_quarter($2, $3)
  WHEN $1 = 'year' THEN
    gd_year($2, $3)
  ELSE
    NULL
  END;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_period(text, timestamptz, text)
  RETURNS date AS
$$
  SELECT CASE
  WHEN $1 = 'day' THEN
    gd_day($2, $3)
  WHEN $1 = 'week' THEN
    gd_week($2, $3)
  WHEN $1 = 'month' THEN
    gd_month($2, $3)
  WHEN $1 = 'quarter' THEN
    gd_quarter($2, $3)
  WHEN $1 = 'year' THEN
    gd_year($2, $3)
  ELSE
    NULL
  END;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_period(text, date, text)
  RETURNS date AS
$$
  SELECT CASE
  WHEN $1 = 'day' THEN
    gd_day($2, $3)
  WHEN $1 = 'week' THEN
    gd_week($2, $3)
  WHEN $1 = 'month' THEN
    gd_month($2, $3)
  WHEN $1 = 'quarter' THEN
    gd_quarter($2, $3)
  WHEN $1 = 'year' THEN
    gd_year($2, $3)
  ELSE
    NULL
  END;
$$
  LANGUAGE SQL STABLE;


COMMIT;
