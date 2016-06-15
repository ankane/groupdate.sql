BEGIN;

DROP FUNCTION IF EXISTS gday(date);
DROP FUNCTION IF EXISTS gday(date, text);
DROP FUNCTION IF EXISTS gday(timestamptz, text);
DROP FUNCTION IF EXISTS gday(timestamp, text);
DROP FUNCTION IF EXISTS gday(timestamptz);
DROP FUNCTION IF EXISTS gday(timestamp);

DROP FUNCTION IF EXISTS gweek(date);
DROP FUNCTION IF EXISTS gweek(date, text);
DROP FUNCTION IF EXISTS gweek(timestamptz, text);
DROP FUNCTION IF EXISTS gweek(timestamp, text);
DROP FUNCTION IF EXISTS gweek(timestamptz);
DROP FUNCTION IF EXISTS gweek(timestamp);

DROP FUNCTION IF EXISTS gmonth(date);
DROP FUNCTION IF EXISTS gmonth(date, text);
DROP FUNCTION IF EXISTS gmonth(timestamptz, text);
DROP FUNCTION IF EXISTS gmonth(timestamp, text);
DROP FUNCTION IF EXISTS gmonth(timestamptz);
DROP FUNCTION IF EXISTS gmonth(timestamp);

DROP FUNCTION IF EXISTS gperiod(text, date);
DROP FUNCTION IF EXISTS gperiod(text, date, text);
DROP FUNCTION IF EXISTS gperiod(text, timestamptz, text);
DROP FUNCTION IF EXISTS gperiod(text, timestamp, text);
DROP FUNCTION IF EXISTS gperiod(text, timestamptz);
DROP FUNCTION IF EXISTS gperiod(text, timestamp);

COMMIT;
