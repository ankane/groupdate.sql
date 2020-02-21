require_relative "test_helper"

class TestPostgresql < Minitest::Test
  include TestGroupdate

  def conn
    @@conn ||=
      begin
        conn = PG.connect(dbname: "groupdatesql_test")
        conn.query File.read("postgresql/uninstall.sql")
        conn.query File.read("postgresql/install.sql")
        conn.query "SET time zone 'UTC'"
        conn.type_map_for_results = PG::BasicTypeMapForResults.new(conn)
        conn.query <<-SQL
CREATE OR REPLACE FUNCTION gd_time_zone()
  RETURNS text AS
$$
  SELECT 'America/Los_Angeles'::text;
$$
  LANGUAGE SQL IMMUTABLE;
        SQL
        conn
      end
  end

  def set_week_start(week_start)
    conn.query <<-SQL
CREATE OR REPLACE FUNCTION gd_week_start()
  RETURNS int AS
$$
  SELECT #{week_start};
$$
  LANGUAGE SQL IMMUTABLE;
    SQL
  end

  def assert_time(function, expected, time_str)
    expected = Time.parse(expected)
    assert_sql expected, "SELECT gd_#{function}('#{time_str}'::timestamp)"
    assert_sql expected, "SELECT gd_#{function}('#{time_str}'::timestamptz)"
  end

  def assert_date(function, expected, time_str)
    expected = Date.parse(expected)
    assert_sql expected, "SELECT gd_#{function}('#{time_str}'::date)"
    assert_sql expected, "SELECT gd_#{function}('#{time_str}'::date, 'America/Los_Angeles')"
    assert_sql expected, "SELECT gd_period('#{function}', '#{time_str}'::date)"
    assert_sql expected, "SELECT gd_period('#{function}', '#{time_str}'::date, 'America/Los_Angeles')"
  end

  def assert_date_time(function, expected, time_str, period = true, time_zone = "America/Los_Angeles")
    expected = Date.parse(expected) if expected.is_a?(String)
    assert_sql expected, "SELECT gd_#{function}('#{time_str}'::timestamp, '#{time_zone}')"
    assert_sql expected, "SELECT gd_#{function}('#{time_str}'::timestamptz, '#{time_zone}')"
    if period
      assert_sql expected, "SELECT gd_period('#{function}', '#{time_str}'::timestamp, '#{time_zone}')"
      assert_sql expected, "SELECT gd_period('#{function}', '#{time_str}'::timestamptz, '#{time_zone}')"
    end

    if time_zone == "America/Los_Angeles"
      assert_sql expected, "SELECT gd_#{function}('#{time_str}'::timestamp)"
      assert_sql expected, "SELECT gd_#{function}('#{time_str}'::timestamptz)"
      if period
        assert_sql expected, "SELECT gd_period('#{function}', '#{time_str}'::timestamp)"
        assert_sql expected, "SELECT gd_period('#{function}', '#{time_str}'::timestamptz)"
      end
    end
  end
end
