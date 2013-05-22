require "test_helper"

# import files
$conn = PG.connect(:dbname => "groupdate_test")
$conn.query File.read("postgresql.sql")
$conn.query "SET TIMEZONE TO 'America/New_York'"

def assert_sql(expected, sql)
  assert_equal [[expected]], $conn.query(sql).map(&:values)
end

def assert_result(function, expected, time_str, time_zone = false)
  tz_str = time_zone ? ", 'America/Los_Angeles'" : ""
  assert_sql expected, "SELECT #{function}('#{time_str}'::timestamp#{tz_str})"
  assert_sql expected, "SELECT #{function}('#{time_str}'::timestamptz#{tz_str})"
end

def assert_result_time(function, expected, time_str, time_zone = false)
  assert_result function, Time.parse(expected), time_str, time_zone
end

describe "postgresql.sql" do
  include Tests
end
