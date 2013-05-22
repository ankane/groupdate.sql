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

Group by day

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
```

Group by day of week

```sql
SELECT gd_day_of_week(created_at, 'America/Los_Angeles') AS day_of_week, COUNT(*) FROM orders GROUP BY day_of_week;
```

returns

```
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

## Installation

### For PostgreSQL

```sh
curl https://raw.github.com/ankane/groupdate.sql/master/postgresql.sql | psql db_name
```

### For MySQL

```sh
curl https://raw.github.com/ankane/groupdate.sql/master/mysql.sql | mysql -u root db_name
```
## Complete list

gd_

- second
- minute
- hour
- day
- week
- month
- year
- hour_of_day
- day_of_week

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
