# Groupdate.sql

The simplest way to group by:

- day
- week
- month
- day of the week
- hour of the day
- and more (complete list at bottom)

:tada: Time zones supported!! **the best part**

:earth_americas: Use it with any programming language **the other best part**

Supports PostgreSQL and MySQL

## Usage

Groupdate.sql creates SQL functions, which are stored by the database.

You can use these functions with any ORM (or without one).

#### SQL

Group by day

```sql
SELECT gd_day(created_at, 'America/Los_Angeles') AS day, COUNT(*)
  FROM users GROUP BY day;
-- result
          day           | count
------------------------+-------
 2013-04-11 07:00:00+00 |   145
 2013-04-12 07:00:00+00 |    65
 2013-04-13 07:00:00+00 |   293
```

Group by week

```sql
SELECT gd_week(created_at, 'America/Chicago') AS week, COUNT(*)
  FROM users GROUP BY week;
-- result
          week          | count
------------------------+-------
 2013-05-05 05:00:00+00 |  1327
 2013-05-12 05:00:00+00 |  3432
 2013-05-19 05:00:00+00 |   673
```

Group by day of week

```sql
SELECT gd_day_of_week(created_at, 'America/New_York') AS day_of_week, COUNT(*)
  FROM orders GROUP BY day_of_week;
-- result
 day_of_week | count
-------------+-------
           0 |   167
           1 |   273
           2 |   439
           3 |   285
           4 |   318
           5 |   123
           6 |   189
```

**Note:** Weeks start on Sunday.

#### Language / Frameworks

Ruby on Rails (activerecord)

```ruby
User.group("gd_day(created_at)").count
```

Django, Node.js, Go, etc

```python
# pull requests please :)
```

## Installation

Run this SQL

- [PostgreSQL](https://raw.githubusercontent.com/ankane/groupdate.sql/master/postgresql.sql)
- [MySQL](https://raw.githubusercontent.com/ankane/groupdate.sql/master/mysql.sql)

For MySQL, [time zone support](http://dev.mysql.com/doc/refman/5.6/en/time-zone-support.html) must be installed on the server.

```sh
mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -u root mysql
```

## Complete list

All functions are prefixed with `gd_` to prevent conflicts with MySQL functions.

- second
- minute
- hour
- day
- week - starts Sunday
- week_mon - starts Monday
- month
- year
- hour_of_day
- day_of_week

A list of time zones can be found [here](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)

## Uninstall

Run this SQL

- [PostgreSQL](https://raw.githubusercontent.com/ankane/groupdate.sql/master/uninstall_postgresql.sql)
- [MySQL](https://raw.githubusercontent.com/ankane/groupdate.sql/master/uninstall_mysql.sql)

## Contributing

Everyone is encouraged to help improve this project. Here are a few ways you can help:

- [Report bugs](https://github.com/ankane/groupdate.sql/issues)
- Fix bugs and [submit pull requests](https://github.com/ankane/groupdate.sql/pulls)
- Write, clarify, or fix documentation
- Suggest or add new features
