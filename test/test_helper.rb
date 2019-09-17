require "bundler/setup"
Bundler.require :default
require "minitest/autorun"
require "minitest/pride"
require "time"

module TestGroupdate

  # second

  def test_gd_second_end_of_second
    assert_time :second, "2013-05-03 00:00:00 UTC", "2013-05-03 00:00:00.499"
  end

  def test_gd_second_start_of_second
    assert_time :second, "2013-05-03 00:00:01 UTC", "2013-05-03 00:00:01.000"
  end

  # minute

  def test_gd_minute_end_of_minute
    assert_time :minute, "2013-05-03 00:00:00 UTC", "2013-05-03 00:00:59"
  end

  def test_gd_minute_start_of_minute
    assert_time :minute, "2013-05-03 00:01:00 UTC", "2013-05-03 00:01:00"
  end

  # hour

  def test_gd_hour_end_of_hour
    assert_time :hour, "2013-05-03 00:00:00 UTC", "2013-05-03 00:59:59"
  end

  def test_gd_hour_start_of_hour
    assert_time :hour, "2013-05-03 01:00:00 UTC", "2013-05-03 01:00:00"
  end

  # day

  def test_gd_day_date
    assert_date :day, "2013-05-03", "2013-05-03"
  end

  def test_gd_day_time_end_of_day
    assert_date_time :day, "2013-05-02", "2013-05-03 06:59:59"
  end

  def test_gd_day_time_start_of_day_time
    assert_date_time :day, "2013-05-03", "2013-05-03 07:00:00"
  end

  def test_gd_day_utc_end_of_day
    assert_date_utc_time :day, "2013-05-03", "2013-05-03 23:59:59"
  end

  def test_gd_day_utc_start_of_day
    assert_date_utc_time :day, "2013-05-04", "2013-05-04 00:00:00"
  end

  # week

  def test_gd_week_date_end_of_week
    assert_date :week, "2013-03-17", "2013-03-23"
  end

  def test_gd_week_date_start_of_week
    assert_date :week, "2013-03-24", "2013-03-24"
  end

  def test_gd_week_time_end_of_week
    assert_date_time :week, "2013-03-03", "2013-03-10 06:59:59"
  end

  def test_gd_week_time_start_of_week
    assert_date_time :week, "2013-03-10", "2013-03-10 08:00:00"
  end

  def test_gd_week_utc_end_of_week
    assert_date_utc_time :week, "2013-03-17", "2013-03-23 23:59:59"
  end

  def test_gd_week_utc_start_of_week
    assert_date_utc_time :week, "2013-03-24", "2013-03-24 00:00:00"
  end

  # week mon

  def test_gd_week_mon_date_end_of_week
    week_start 0 do
      assert_date :week, "2013-03-18", "2013-03-24"
    end
  end

  def test_gd_week_mon_date_start_of_week
    week_start 0 do
      assert_date :week, "2013-03-25", "2013-03-25"
    end
  end

  def test_gd_week_mon_time_end_of_week
    week_start 0 do
      assert_date_time :week, "2013-03-04", "2013-03-11 06:59:59"
    end
  end

  def test_gd_week_mon_time_start_of_week
    week_start 0 do
      assert_date_time :week, "2013-03-11", "2013-03-11 07:00:00"
    end
  end

  def test_gd_week_mon_utc_end_of_week
    week_start 0 do
      assert_date_utc_time :week, "2013-03-18", "2013-03-24 23:59:59"
    end
  end

  def test_gd_week_mon_utc_start_of_week
    week_start 0 do
      assert_date_utc_time :week, "2013-03-25", "2013-03-25 00:00:00"
    end
  end

  # month

  def test_gd_month_date_end_of_month
    assert_date :month, "2013-05-01", "2013-05-31"
  end

  def test_gd_month_date_start_of_month
    assert_date :month, "2013-06-01", "2013-06-01"
  end

  def test_gd_month_time_end_of_month
    assert_date_time :month, "2013-05-01", "2013-06-01 06:59:59"
  end

  def test_gd_month_time_start_of_month
    assert_date_time :month, "2013-06-01", "2013-06-01 07:00:00"
  end

  def test_gd_month_utc_end_of_month
    assert_date_utc_time :month, "2013-05-01", "2013-05-31 23:59:59"
  end

  def test_gd_month_utc_start_of_month
    assert_date_utc_time :month, "2013-06-01", "2013-06-01 00:00:00"
  end

  # year

  def test_gd_year_date_end_of_year
    assert_date :year, "2013-01-01", "2013-12-31"
  end

  def test_gd_year_date_start_of_year
    assert_date :year, "2013-01-01", "2013-01-01"
  end

  def test_gd_year_time_end_of_year
    assert_date_time :year, "2013-01-01", "2014-01-01 07:59:59"
  end

  def test_gd_year_time_start_of_year
    assert_date_time :year, "2013-01-01", "2013-01-01 08:00:00"
  end

  def test_gd_year_utc_end_of_year
    assert_date_utc_time :year, "2013-01-01", "2013-12-31 23:59:59"
  end

  def test_gd_year_utc_start_of_year
    assert_date_utc_time :year, "2013-01-01", "2013-01-01 00:00:00"
  end

  # hour of day

  def test_gd_hour_of_day_end_of_hour
    assert_date_utc_time :hour_of_day, 0, "2013-01-01 00:59:59", false
  end

  def test_gd_hour_of_day_start_of_hour
    assert_date_utc_time :hour_of_day, 1, "2013-01-01 01:00:00", false
  end

  def test_gd_hour_of_day_end_of_hour_with_time_zone
    assert_date_time :hour_of_day, 0, "2013-01-01 08:59:59", false
  end

  def test_gd_hour_of_day_start_of_hour_with_time_zone
    assert_date_time :hour_of_day, 1, "2013-01-01 09:00:00", false
  end

  # day of week

  def test_gd_day_of_week_end_of_day
    assert_date_utc_time :day_of_week, 2, "2013-01-01 23:59:59", false
  end

  def test_gd_day_of_week_start_of_day
    assert_date_utc_time :day_of_week, 3, "2013-01-02 00:00:00", false
  end

  def test_gd_day_of_week_end_of_week_with_time_zone
    assert_date_time :day_of_week, 2, "2013-01-02 07:59:59", false
  end

  def test_gd_day_of_week_start_of_week_with_time_zone
    assert_date_time :day_of_week, 3, "2013-01-02 08:00:00", false
  end

  # day of month

  def test_gd_day_of_month_end_of_day
    assert_date_utc_time :day_of_month, 1, "2013-01-01 23:59:59", false
  end

  def test_gd_day_of_month_start_of_day
    assert_date_utc_time :day_of_month, 2, "2013-01-02 00:00:00", false
  end

  def test_gd_day_of_month_end_of_week_with_time_zone
    assert_date_time :day_of_month, 1, "2013-01-02 07:59:59", false
  end

  def test_gd_day_of_month_start_of_week_with_time_zone
    assert_date_time :day_of_month, 2, "2013-01-02 08:00:00", false
  end

  # day of year

  def test_gd_day_of_year_end_of_day
    assert_date_utc_time :day_of_year, 1, "2013-01-01 23:59:59", false
  end

  def test_gd_day_of_year_start_of_day
    assert_date_utc_time :day_of_year, 2, "2013-01-02 00:00:00", false
  end

  def test_gd_day_of_year_end_of_week_with_time_zone
    assert_date_time :day_of_year, 1, "2013-01-02 07:59:59", false
  end

  def test_gd_day_of_year_start_of_week_with_time_zone
    assert_date_time :day_of_year, 2, "2013-01-02 08:00:00", false
  end

  # month of year

  def test_gd_month_of_year_time_end_of_month
    assert_date_time :month_of_year, 5, "2013-06-01 06:59:59", false
  end

  def test_gd_month_of_year_time_start_of_month
    assert_date_time :month_of_year, 6, "2013-06-01 07:00:00", false
  end

  def test_gd_month_of_year_utc_end_of_month
    assert_date_utc_time :month_of_year, 5, "2013-05-31 23:59:59", false
  end

  def test_gd_month_of_year_utc_start_of_month
    assert_date_utc_time :month_of_year, 6, "2013-06-01 00:00:00", false
  end

  # helpers

  def assert_sql(expected, sql)
    assert_equal [[expected]], conn.query(sql).map(&:values)
  end

  def week_start(week_start)
    set_week_start(week_start)
    yield
  ensure
    set_week_start(6)
  end
end
