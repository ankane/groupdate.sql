# Groupdate.sql

The simplest way to group by:

- day
- week
- month
- day of the week
- hour of the day
- and more (complete list at bottom)

:tada: Time zones supported!! **the best part**

Supports PostgreSQL and MySQL

## Usage

```sql
SELECT gd_day(created_at, 'America/Los_Angeles') AS day, COUNT(*) FROM users GROUP BY day;
```

returns

```sh
          day           | count
------------------------+-------
 2013-04-11 07:00:00+00 |   145
 2013-04-12 07:00:00+00 |    65
 2013-04-13 07:00:00+00 |   293
(3 rows)
```

## Installation

### For PostgreSQL

```sh
curl https://raw.github.com/ankane/groupdate.sql/master/postgresql.sql | psql db_name
```

### For MySQL

```sh
curl https://raw.github.com/ankane/groupdate.sql/master/mysql.sql | mysql -u root db_name
```
