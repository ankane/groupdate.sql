require "test_helper"

# import files
$conn = Mysql2::Client.new(:host => "localhost", :username => "root", database: "groupdate_test")

# have to import manually mysql.sql

$conn.query "SET time_zone = 'America/New_York'"

def assert_sql(expected, sql)
  assert_equal [[expected]], $conn.query(sql).map(&:values)
end

def assert_result(function, expected, time_str, time_zone = false)
  # skip if no time zone
  if time_zone
    assert_sql expected, "SELECT #{function}('#{time_str}', 'America/Los_Angeles')"
  end
end

def assert_result_time(function, expected, time_str, time_zone = false)
  assert_result function, Time.parse(expected), time_str, time_zone
end

describe "mysql.sql" do
  include Tests
end
