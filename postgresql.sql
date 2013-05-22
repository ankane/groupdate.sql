-- second

CREATE OR REPLACE FUNCTION gd_second(timestamptz)
  RETURNS timestamptz AS
$$
  SELECT DATE_TRUNC('second', $1)::timestamptz;
$$
  LANGUAGE SQL;


CREATE OR REPLACE FUNCTION gd_second(timestamp)
  RETURNS timestamptz AS
$$
  SELECT gd_second($1::timestamptz);
$$
  LANGUAGE SQL;


-- minute

CREATE OR REPLACE FUNCTION gd_minute(timestamptz)
  RETURNS timestamptz AS
$$
  SELECT DATE_TRUNC('minute', $1)::timestamptz;
$$
  LANGUAGE SQL;


CREATE OR REPLACE FUNCTION gd_minute(timestamp)
  RETURNS timestamptz AS
$$
  SELECT gd_minute($1::timestamptz);
$$
  LANGUAGE SQL;


-- hour

CREATE OR REPLACE FUNCTION gd_hour(timestamptz)
  RETURNS timestamptz AS
$$
  SELECT DATE_TRUNC('hour', $1)::timestamptz;
$$
  LANGUAGE SQL;


CREATE OR REPLACE FUNCTION gd_hour(timestamp)
  RETURNS timestamptz AS
$$
  SELECT gd_hour($1::timestamptz);
$$
  LANGUAGE SQL;


-- day

CREATE OR REPLACE FUNCTION gd_day(timestamptz)
  RETURNS timestamptz AS
$$
  SELECT DATE_TRUNC('day', $1)::timestamptz;
$$
  LANGUAGE SQL;


CREATE OR REPLACE FUNCTION gd_day(timestamp)
  RETURNS timestamptz AS
$$
  SELECT gd_day($1::timestamptz);
$$
  LANGUAGE SQL;


-- day w/ time zone

CREATE OR REPLACE FUNCTION gd_day(timestamptz, text)
  RETURNS timestamptz AS
$$
  SELECT DATE_TRUNC('day', $1 AT TIME ZONE $2) AT TIME ZONE $2;
$$
  LANGUAGE SQL;


CREATE OR REPLACE FUNCTION gd_day(timestamp, text)
  RETURNS timestamptz AS
$$
  SELECT gd_day($1::timestamptz, $2);
$$
  LANGUAGE SQL;


-- week

CREATE OR REPLACE FUNCTION gd_week(timestamptz)
  RETURNS timestamptz AS
$$
  SELECT DATE_TRUNC('week', ($1 + INTERVAL '1 day')) - INTERVAL '1 day';
$$
  LANGUAGE SQL;


CREATE OR REPLACE FUNCTION gd_week(timestamp)
  RETURNS timestamptz AS
$$
  SELECT gd_week($1::timestamptz);
$$
  LANGUAGE SQL;


-- week w/ time zone

CREATE OR REPLACE FUNCTION gd_week(timestamptz, text)
  RETURNS timestamptz AS
$$
  SELECT (DATE_TRUNC('week', ($1 + INTERVAL '1 day') AT TIME ZONE $2) - INTERVAL '1 day') AT TIME ZONE $2;
$$
  LANGUAGE SQL;


CREATE OR REPLACE FUNCTION gd_week(timestamp, text)
  RETURNS timestamptz AS
$$
  SELECT gd_week($1::timestamptz, $2);
$$
  LANGUAGE SQL;


-- month

CREATE OR REPLACE FUNCTION gd_month(timestamptz)
  RETURNS timestamptz AS
$$
  SELECT DATE_TRUNC('month', $1)::timestamptz;
$$
  LANGUAGE SQL;


CREATE OR REPLACE FUNCTION gd_month(timestamp)
  RETURNS timestamptz AS
$$
  SELECT gd_month($1::timestamptz);
$$
  LANGUAGE SQL;


-- month w/ time zone

CREATE OR REPLACE FUNCTION gd_month(timestamptz, text)
  RETURNS timestamptz AS
$$
  SELECT DATE_TRUNC('month', $1 AT TIME ZONE $2) AT TIME ZONE $2;
$$
  LANGUAGE SQL;


CREATE OR REPLACE FUNCTION gd_month(timestamp, text)
  RETURNS timestamptz AS
$$
  SELECT gd_month($1::timestamptz, $2);
$$
  LANGUAGE SQL;


-- year

CREATE OR REPLACE FUNCTION gd_year(timestamptz)
  RETURNS timestamptz AS
$$
  SELECT DATE_TRUNC('year', $1)::timestamptz;
$$
  LANGUAGE SQL;


CREATE OR REPLACE FUNCTION gd_year(timestamp)
  RETURNS timestamptz AS
$$
  SELECT gd_year($1::timestamptz);
$$
  LANGUAGE SQL;


-- year w/ time zone

CREATE OR REPLACE FUNCTION gd_year(timestamptz, text)
  RETURNS timestamptz AS
$$
  SELECT DATE_TRUNC('year', $1 AT TIME ZONE $2) AT TIME ZONE $2;
$$
  LANGUAGE SQL;


CREATE OR REPLACE FUNCTION gd_year(timestamp, text)
  RETURNS timestamptz AS
$$
  SELECT gd_year($1::timestamptz, $2);
$$
  LANGUAGE SQL;


-- hour of day

CREATE OR REPLACE FUNCTION gd_hour_of_day(timestamptz)
  RETURNS integer AS
$$
  SELECT EXTRACT(HOUR FROM $1)::integer;
$$
  LANGUAGE SQL;


CREATE OR REPLACE FUNCTION gd_hour_of_day(timestamp)
  RETURNS integer AS
$$
  SELECT gd_hour_of_day($1::timestamptz);
$$
  LANGUAGE SQL;


-- hour of day w/ time zone

CREATE OR REPLACE FUNCTION gd_hour_of_day(timestamptz, text)
  RETURNS integer AS
$$
  SELECT EXTRACT(HOUR FROM $1 AT TIME ZONE $2)::integer;
$$
  LANGUAGE SQL;


CREATE OR REPLACE FUNCTION gd_hour_of_day(timestamp, text)
  RETURNS integer AS
$$
  SELECT gd_hour_of_day($1::timestamptz, $2);
$$
  LANGUAGE SQL;


-- day of week

CREATE OR REPLACE FUNCTION gd_day_of_week(timestamptz)
  RETURNS integer AS
$$
  SELECT EXTRACT(DOW FROM $1)::integer;
$$
  LANGUAGE SQL;


CREATE OR REPLACE FUNCTION gd_day_of_week(timestamp)
  RETURNS integer AS
$$
  SELECT gd_day_of_week($1::timestamptz);
$$
  LANGUAGE SQL;


-- day of week w/ time zone

CREATE OR REPLACE FUNCTION gd_day_of_week(timestamptz, text)
  RETURNS integer AS
$$
  SELECT EXTRACT(DOW FROM $1 AT TIME ZONE $2)::integer;
$$
  LANGUAGE SQL;


CREATE OR REPLACE FUNCTION gd_day_of_week(timestamp, text)
  RETURNS integer AS
$$
  SELECT gd_day_of_week($1::timestamptz, $2);
$$
  LANGUAGE SQL;

