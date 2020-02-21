require_relative "test_helper"

class TestMysql < Minitest::Test
  include TestGroupdate

  def conn
    @@conn ||=
      begin
        conn =
          Mysql2::Client.new(
            host: "localhost",
            username: "root",
            database: "groupdatesql_test",
            database_timezone: :utc,
            flags: Mysql2::Client::MULTI_STATEMENTS
          )

        conn.query File.read("mysql/uninstall.sql")
        conn.abandon_results!

        conn.query File.read("mysql/install.sql")
        conn.abandon_results!

        conn
      end
  end

  def set_week_start(week_start)
    conn.query <<-SQL
DROP FUNCTION IF EXISTS gd_week_start;
CREATE FUNCTION gd_week_start()
  RETURNS INT
  RETURN #{week_start};
    SQL
    conn.abandon_results!
  end

  def assert_time(function, expected, time_str)
    expected = Time.parse(expected)
    assert_sql expected, "SELECT gd_#{function}('#{time_str}', 'America/Los_Angeles')"
  end

  def assert_date(function, expected, time_str)
    # nothing to test
  end

  def assert_date_time(function, expected, time_str, period = true, time_zone = "America/Los_Angeles")
    expected = Date.parse(expected) if expected.is_a?(String)
    assert_sql expected, "SELECT gd_#{function}('#{time_str}', '#{time_zone}')"
    if period
      assert_sql expected, "SELECT gd_period('#{function}', '#{time_str}', '#{time_zone}')"
    end
  end
end
