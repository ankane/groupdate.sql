require "bundler/setup"
Bundler.require :default
require "minitest/autorun"
require "minitest/pride"
require "time"

module TestGroupdate

  # day

  def test_gday_date
    assert_date :gday, "2013-05-03", "2013-05-03"
  end

  def test_gday_time_end_of_day
    assert_time :gday, "2013-05-02", "2013-05-03 06:59:59"
  end

  def test_gday_time_start_of_day_time
    assert_time :gday, "2013-05-03", "2013-05-03 07:00:00"
  end

  def test_gday_utc_end_of_day
    assert_time_utc :gday, "2013-05-03", "2013-05-03 23:59:59"
  end

  def test_gday_utc_start_of_day
    assert_time_utc :gday, "2013-05-04", "2013-05-04 00:00:00"
  end

  # week

  def test_gweek_date_end_of_week
    assert_date :gweek, "2013-03-18", "2013-03-24"
  end

  def test_gweek_date_start_of_week
    assert_date :gweek, "2013-03-25", "2013-03-25"
  end

  def test_gweek_time_end_of_week
    assert_time :gweek, "2013-03-04", "2013-03-11 06:59:59"
  end

  def test_gweek_time_start_of_week
    assert_time :gweek, "2013-03-11", "2013-03-11 07:00:00"
  end

  def test_gweek_utc_end_of_week
    assert_time_utc :gweek, "2013-03-18", "2013-03-24 23:59:59"
  end

  def test_gweek_utc_start_of_week
    assert_time_utc :gweek, "2013-03-25", "2013-03-25 00:00:00"
  end

  # month

  def test_gmonth_date_end_of_month
    assert_date :gmonth, "2013-05-01", "2013-05-31"
  end

  def test_gmonth_date_start_of_month
    assert_date :gmonth, "2013-06-01", "2013-06-01"
  end

  def test_gmonth_time_end_of_month
    assert_time :gmonth, "2013-05-01", "2013-06-01 06:59:59"
  end

  def test_gmonth_time_start_of_month
    assert_time :gmonth, "2013-06-01", "2013-06-01 07:00:00"
  end

  def test_gmonth_utc_end_of_month
    assert_time_utc :gmonth, "2013-05-01", "2013-05-31 23:59:59"
  end

  def test_gmonth_utc_start_of_month
    assert_time_utc :gmonth, "2013-06-01", "2013-06-01 00:00:00"
  end

  # helpers

  def assert_date(function, expected, time_str)
    assert_sql Date.parse(expected), "SELECT #{function}('#{time_str}'::date)"
    assert_sql Date.parse(expected), "SELECT #{function}('#{time_str}'::date, 'America/Los_Angeles')"
  end

  def assert_time(function, expected, time_str)
    expected = Date.parse(expected)
    assert_sql expected, "SELECT #{function}('#{time_str}'::timestamp)"
    assert_sql expected, "SELECT #{function}('#{time_str}'::timestamptz)"
    assert_sql expected, "SELECT #{function}('#{time_str}'::timestamp, 'America/Los_Angeles')"
    assert_sql expected, "SELECT #{function}('#{time_str}'::timestamptz, 'America/Los_Angeles')"
  end

  def assert_time_utc(function, expected, time_str)
    expected = Date.parse(expected)
    assert_sql expected, "SELECT #{function}('#{time_str}'::timestamp, 'Etc/UTC')"
    assert_sql expected, "SELECT #{function}('#{time_str}'::timestamptz, 'Etc/UTC')"
  end

  def assert_sql(expected, sql)
    assert_equal [[expected]], conn.query(sql).map(&:values)
  end
end
