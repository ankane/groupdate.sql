require "bundler/setup"
Bundler.require :default
require "minitest/autorun"
require "minitest/pride"
require "time"

module TestGroupdate

  # second

  def test_gd_second_end_of_second
    assert_result_time :gd_second, "2013-05-03 00:00:00 UTC", "2013-05-03 00:00:00.999"
  end

  def test_gd_second_start_of_second
    assert_result_time :gd_second, "2013-05-03 00:00:01 UTC", "2013-05-03 00:00:01.000"
  end

  # minute

  def test_gd_minute_end_of_minute
    assert_result_time :gd_minute, "2013-05-03 00:00:00 UTC", "2013-05-03 00:00:59"
  end

  def test_gd_minute_start_of_minute
    assert_result_time :gd_minute, "2013-05-03 00:01:00 UTC", "2013-05-03 00:01:00"
  end

  # hour

  def test_gd_hour_end_of_hour
    assert_result_time :gd_hour, "2013-05-03 00:00:00 UTC", "2013-05-03 00:59:59"
  end

  def test_gd_hour_start_of_hour
    assert_result_time :gd_hour, "2013-05-03 01:00:00 UTC", "2013-05-03 01:00:00"
  end

  # day

  def test_gd_day_end_of_day
    assert_result_time :gd_day, "2013-05-03 00:00:00 UTC", "2013-05-03 23:59:59"
  end

  def test_gd_day_start_of_day
    assert_result_time :gd_day, "2013-05-04 00:00:00 UTC", "2013-05-04 00:00:00"
  end

  def test_gd_day_end_of_day_with_time_zone
    assert_result_time :gd_day, "2013-05-02 00:00:00 PDT", "2013-05-03 06:59:59", true
  end

  def test_gd_day_start_of_day_with_time_zone
    assert_result_time :gd_day, "2013-05-03 00:00:00 PDT", "2013-05-03 07:00:00", true
  end

  # week

  def test_gd_week_end_of_week
    assert_result_time :gd_week, "2013-03-17 00:00:00 UTC", "2013-03-23 23:59:59"
  end

  def test_gd_week_start_of_week
    assert_result_time :gd_week, "2013-03-24 00:00:00 UTC", "2013-03-24 00:00:00"
  end

  def test_gd_week_end_of_week_with_time_zone
    assert_result_time :gd_week, "2013-03-10 00:00:00 PST", "2013-03-17 06:59:59", true
  end

  def test_gd_week_start_of_week_with_time_zone
    assert_result_time :gd_week, "2013-03-17 00:00:00 PDT", "2013-03-17 07:00:00", true
  end

  # week monday

  def test_gd_week_mon_end_of_week
    assert_result_time :gd_week_mon, "2013-03-18 00:00:00 UTC", "2013-03-24 23:59:59"
  end

  def test_gd_week_mon_start_of_week
    assert_result_time :gd_week_mon, "2013-03-25 00:00:00 UTC", "2013-03-25 00:00:00"
  end

  def test_gd_week_mon_end_of_week_with_time_zone
    assert_result_time :gd_week_mon, "2013-03-04 00:00:00 PST", "2013-03-11 06:59:59", true
  end

  def test_gd_week_mon_start_of_week_with_time_zone
    assert_result_time :gd_week_mon, "2013-03-11 00:00:00 PDT", "2013-03-11 07:00:00", true
  end

  # month

  def test_gd_month_end_of_month
    assert_result_time :gd_month, "2013-05-01 00:00:00 UTC", "2013-05-31 23:59:59"
  end

  def test_gd_month_start_of_month
    assert_result_time :gd_month, "2013-06-01 00:00:00 UTC", "2013-06-01 00:00:00"
  end

  def test_gd_month_end_of_month_with_time_zone
    assert_result_time :gd_month, "2013-05-01 00:00:00 PDT", "2013-06-01 06:59:59", true
  end

  def test_gd_month_start_of_month_with_time_zone
    assert_result_time :gd_month, "2013-06-01 00:00:00 PDT", "2013-06-01 07:00:00", true
  end

  # year

  def test_gd_year_end_of_year
    assert_result_time :gd_year, "2013-01-01 00:00:00 UTC", "2013-12-31 23:59:59"
  end

  def test_gd_year_start_of_year
    assert_result_time :gd_year, "2014-01-01 00:00:00 UTC", "2014-01-01 00:00:00"
  end

  def test_gd_year_end_of_year_with_time_zone
    assert_result_time :gd_year, "2013-01-01 00:00:00 PST", "2014-01-01 07:59:59", true
  end

  def test_gd_year_start_of_year_with_time_zone
    assert_result_time :gd_year, "2014-01-01 00:00:00 PST", "2014-01-01 08:00:00", true
  end

  # hour of day

  def test_gd_hour_of_day_end_of_hour
    assert_result :gd_hour_of_day, 0, "2013-01-01 00:59:59"
  end

  def test_gd_hour_of_day_start_of_hour
    assert_result :gd_hour_of_day, 1, "2013-01-01 01:00:00"
  end

  def test_gd_hour_of_day_end_of_hour_with_time_zone
    assert_result :gd_hour_of_day, 0, "2013-01-01 08:59:59", true
  end

  def test_gd_hour_of_day_start_of_hour_with_time_zone
    assert_result :gd_hour_of_day, 1, "2013-01-01 09:00:00", true
  end

  # day of week

  def test_gd_day_of_week_end_of_day
    assert_result :gd_day_of_week, 2, "2013-01-01 23:59:59"
  end

  def test_gd_day_of_week_start_of_day
    assert_result :gd_day_of_week, 3, "2013-01-02 00:00:00"
  end

  def test_gd_day_of_week_end_of_week_with_time_zone
    assert_result :gd_day_of_week, 2, "2013-01-02 07:59:59", true
  end

  def test_gd_day_of_week_start_of_week_with_time_zone
    assert_result :gd_day_of_week, 3, "2013-01-02 08:00:00", true
  end

  # helpers

  def assert_result_time(function, expected, time_str, time_zone = false)
    assert_result function, Time.parse(expected), time_str, time_zone
  end

  def assert_sql(expected, sql)
    assert_equal [[expected]], conn.query(sql).map(&:values)
  end

end
