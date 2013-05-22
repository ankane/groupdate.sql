require "bundler/setup"
Bundler.require :default
require "minitest/autorun"
require "minitest/pride"
require "time"

module Tests

  describe "gd_second" do

    it "end of second" do
      assert_result_time :gd_second, "2013-05-03 00:00:00 EDT", "2013-05-03 00:00:00.999"
    end

    it "start of second" do
      assert_result_time :gd_second, "2013-05-03 00:00:01 EDT", "2013-05-03 00:00:01.000"
    end

  end

  describe "gd_minute" do

    it "end of minute" do
      assert_result_time :gd_minute, "2013-05-03 00:00:00 EDT", "2013-05-03 00:00:59"
    end

    it "start of minute" do
      assert_result_time :gd_minute, "2013-05-03 00:01:00 EDT", "2013-05-03 00:01:00"
    end

  end

  describe "gd_hour" do

    it "end of hour" do
      assert_result_time :gd_hour, "2013-05-03 00:00:00 EDT", "2013-05-03 00:59:59"
    end

    it "start of hour" do
      assert_result_time :gd_hour, "2013-05-03 01:00:00 EDT", "2013-05-03 01:00:00"
    end

  end

  describe "gd_day" do

    it "end of day" do
      assert_result_time :gd_day, "2013-05-03 00:00:00 EDT", "2013-05-03 23:59:59"
    end

    it "start of day" do
      assert_result_time :gd_day, "2013-05-04 00:00:00 EDT", "2013-05-04 00:00:00"
    end

    it "end of day with time zone" do
      assert_result_time :gd_day, "2013-05-02 00:00:00 PDT", "2013-05-03 02:59:59", true
    end

    it "start of day with time zone" do
      assert_result_time :gd_day, "2013-05-03 00:00:00 PDT", "2013-05-03 03:00:00", true
    end

  end

  describe "gd_week" do

    it "end of week" do
      assert_result_time :gd_week, "2013-03-17 00:00:00 EDT", "2013-03-23 23:59:59"
    end

    it "start of week" do
      assert_result_time :gd_week, "2013-03-24 00:00:00 EDT", "2013-03-24 00:00:00"
    end

    it "end of week with time zone" do
      assert_result_time :gd_week, "2013-03-10 00:00:00 PST", "2013-03-17 02:59:59", true
    end

    it "start of week with time zone" do
      assert_result_time :gd_week, "2013-03-17 00:00:00 PDT", "2013-03-17 03:00:00", true
    end

  end

  describe "gd_month" do

    it "end of month" do
      assert_result_time :gd_month, "2013-05-01 00:00:00 EDT", "2013-05-31 23:59:59"
    end

    it "start of month" do
      assert_result_time :gd_month, "2013-06-01 00:00:00 EDT", "2013-06-01 00:00:00"
    end

    it "end of month with time zone" do
      assert_result_time :gd_month, "2013-05-01 00:00:00 PDT", "2013-06-01 02:59:59", true
    end

    it "start of month with time zone" do
      assert_result_time :gd_month, "2013-06-01 00:00:00 PDT", "2013-06-01 03:00:00", true
    end

  end

  describe "gd_year" do

    it "end of year" do
      assert_result_time :gd_year, "2013-01-01 00:00:00 EST", "2013-12-31 23:59:59"
    end

    it "start of year" do
      assert_result_time :gd_year, "2014-01-01 00:00:00 EST", "2014-01-01 00:00:00"
    end

    it "end of year with time zone" do
      assert_result_time :gd_year, "2013-01-01 00:00:00 PST", "2014-01-01 02:59:59", true
    end

    it "start of year with time zone" do
      assert_result_time :gd_year, "2014-01-01 00:00:00 PST", "2014-01-01 03:00:00", true
    end

  end

  describe "gd_hour_of_day" do

    it "end of hour" do
      assert_result :gd_hour_of_day, 0, "2013-01-01 00:59:59"
    end

    it "start of hour" do
      assert_result :gd_hour_of_day, 1, "2013-01-01 01:00:00"
    end

    it "end of hour with time zone" do
      assert_result :gd_hour_of_day, 0, "2013-01-01 03:59:59", true
    end

    it "start of hour with time zone" do
      assert_result :gd_hour_of_day, 1, "2013-01-01 04:00:00", true
    end

  end

  describe "gd_day_of_week" do

    it "end of day" do
      assert_result :gd_day_of_week, 2, "2013-01-01 23:59:59"
    end

    it "start of day" do
      assert_result :gd_day_of_week, 3, "2013-01-02 00:00:00"
    end

    it "end of day with time zone" do
      assert_result :gd_day_of_week, 2, "2013-01-02 02:59:59", true
    end

    it "start of day with time zone" do
      assert_result :gd_day_of_week, 3, "2013-01-02 03:00:00", true
    end

  end

end
