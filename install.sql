BEGIN;

-- gday

CREATE OR REPLACE FUNCTION gday(date)
  RETURNS date AS
$$
  SELECT $1;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gday(date, text)
  RETURNS date AS
$$
  SELECT $1;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gday(timestamptz, text)
  RETURNS date AS
$$
  SELECT DATE_TRUNC('day', $1 AT TIME ZONE $2)::date;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gday(timestamp, text)
  RETURNS date AS
$$
  SELECT gday($1::timestamptz, $2);
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gday(timestamptz)
  RETURNS date AS
$$
  SELECT gday($1, 'America/Los_Angeles');
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gday(timestamp)
  RETURNS date AS
$$
  SELECT gday($1::timestamptz, 'America/Los_Angeles');
$$
  LANGUAGE SQL STABLE;


-- gweek

CREATE OR REPLACE FUNCTION gweek(date)
  RETURNS date AS
$$
  SELECT DATE_TRUNC('week', $1)::date;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gweek(date, text)
  RETURNS date AS
$$
  SELECT DATE_TRUNC('week', $1)::date;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gweek(timestamptz, text)
  RETURNS date AS
$$
  SELECT DATE_TRUNC('week', $1 AT TIME ZONE $2)::date;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gweek(timestamp, text)
  RETURNS date AS
$$
  SELECT gweek($1::timestamptz, $2);
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gweek(timestamptz)
  RETURNS date AS
$$
  SELECT gweek($1, 'America/Los_Angeles');
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gweek(timestamp)
  RETURNS date AS
$$
  SELECT gweek($1::timestamptz, 'America/Los_Angeles');
$$
  LANGUAGE SQL STABLE;


-- month

CREATE OR REPLACE FUNCTION gmonth(date)
  RETURNS date AS
$$
  SELECT DATE_TRUNC('month', $1)::date;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gmonth(date, text)
  RETURNS date AS
$$
  SELECT DATE_TRUNC('month', $1)::date;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gmonth(timestamptz, text)
  RETURNS date AS
$$
  SELECT DATE_TRUNC('month', $1 AT TIME ZONE $2)::date;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gmonth(timestamp, text)
  RETURNS date AS
$$
  SELECT gmonth($1::timestamptz, $2);
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gmonth(timestamptz)
  RETURNS date AS
$$
  SELECT gmonth($1, 'America/Los_Angeles');
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gmonth(timestamp)
  RETURNS date AS
$$
  SELECT gmonth($1::timestamptz, 'America/Los_Angeles');
$$
  LANGUAGE SQL STABLE;

-- gperiod

CREATE OR REPLACE FUNCTION gperiod(text, timestamp)
  RETURNS date AS
$$
  SELECT CASE
  WHEN $1 = 'day' THEN
    gday($2)
  WHEN $1 = 'week' THEN
    gweek($2)
  WHEN $1 = 'month' THEN
    gmonth($2)
  ELSE
    NULL
  END;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gperiod(text, timestamptz)
  RETURNS date AS
$$
  SELECT CASE
  WHEN $1 = 'day' THEN
    gday($2)
  WHEN $1 = 'week' THEN
    gweek($2)
  WHEN $1 = 'month' THEN
    gmonth($2)
  ELSE
    NULL
  END;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gperiod(text, date)
  RETURNS date AS
$$
  SELECT CASE
  WHEN $1 = 'day' THEN
    gday($2)
  WHEN $1 = 'week' THEN
    gweek($2)
  WHEN $1 = 'month' THEN
    gmonth($2)
  ELSE
    NULL
  END;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gperiod(text, timestamp, text)
  RETURNS date AS
$$
  SELECT CASE
  WHEN $1 = 'day' THEN
    gday($2, $3)
  WHEN $1 = 'week' THEN
    gweek($2, $3)
  WHEN $1 = 'month' THEN
    gmonth($2, $3)
  ELSE
    NULL
  END;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gperiod(text, timestamptz, text)
  RETURNS date AS
$$
  SELECT CASE
  WHEN $1 = 'day' THEN
    gday($2, $3)
  WHEN $1 = 'week' THEN
    gweek($2, $3)
  WHEN $1 = 'month' THEN
    gmonth($2, $3)
  ELSE
    NULL
  END;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gperiod(text, date, text)
  RETURNS date AS
$$
  SELECT CASE
  WHEN $1 = 'day' THEN
    gday($2, $3)
  WHEN $1 = 'week' THEN
    gweek($2, $3)
  WHEN $1 = 'month' THEN
    gmonth($2, $3)
  ELSE
    NULL
  END;
$$
  LANGUAGE SQL STABLE;

COMMIT;
