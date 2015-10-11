BEGIN;

-- gday

CREATE OR REPLACE FUNCTION gday(date)
  RETURNS date AS
$$
  SELECT $1;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gday(ts timestamptz, time_zone text)
  RETURNS date AS
$$
  from datetime import datetime
  from pytz import timezone
  from pytz import utc
  return datetime.strptime(ts, '%Y-%m-%d %H:%M:%S+00').replace(tzinfo=utc).astimezone(timezone(time_zone)).date()
$$ LANGUAGE plpythonu STABLE;


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


-- -- gweek

-- CREATE OR REPLACE FUNCTION gweek(date)
--   RETURNS date AS
-- $$
--   SELECT DATE_TRUNC('week', $1)::date;
-- $$
--   LANGUAGE SQL STABLE;


-- CREATE OR REPLACE FUNCTION gweek(timestamptz, text)
--   RETURNS date AS
-- $$
--   SELECT (DATE_TRUNC('week', $1 AT TIME ZONE $2) AT TIME ZONE $2)::date;
-- $$
--   LANGUAGE SQL STABLE;


-- CREATE OR REPLACE FUNCTION gweek(timestamp, text)
--   RETURNS date AS
-- $$
--   SELECT gweek($1::timestamptz, $2);
-- $$
--   LANGUAGE SQL STABLE;


-- CREATE OR REPLACE FUNCTION gweek(timestamptz)
--   RETURNS date AS
-- $$
--   SELECT gweek($1, 'America/Los_Angeles');
-- $$
--   LANGUAGE SQL STABLE;


-- CREATE OR REPLACE FUNCTION gweek(timestamp)
--   RETURNS date AS
-- $$
--   SELECT gweek($1::timestamptz, 'America/Los_Angeles');
-- $$
--   LANGUAGE SQL STABLE;


-- -- month

-- CREATE OR REPLACE FUNCTION gmonth(date)
--   RETURNS date AS
-- $$
--   SELECT DATE_TRUNC('month', $1)::date;
-- $$
--   LANGUAGE SQL STABLE;


-- CREATE OR REPLACE FUNCTION gmonth(timestamptz, text)
--   RETURNS date AS
-- $$
--   SELECT (DATE_TRUNC('month', $1 AT TIME ZONE $2) AT TIME ZONE $2)::date;
-- $$
--   LANGUAGE SQL STABLE;


-- CREATE OR REPLACE FUNCTION gmonth(timestamp, text)
--   RETURNS date AS
-- $$
--   SELECT gmonth($1::timestamptz, $2);
-- $$
--   LANGUAGE SQL STABLE;


-- CREATE OR REPLACE FUNCTION gmonth(timestamptz)
--   RETURNS date AS
-- $$
--   SELECT gmonth($1, 'America/Los_Angeles');
-- $$
--   LANGUAGE SQL STABLE;


-- CREATE OR REPLACE FUNCTION gmonth(timestamp)
--   RETURNS date AS
-- $$
--   SELECT gmonth($1::timestamptz, 'America/Los_Angeles');
-- $$
--   LANGUAGE SQL STABLE;


COMMIT;
