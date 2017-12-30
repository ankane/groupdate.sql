require_relative "test_helper"

# note: have to import manually mysql.sql

class TestMysql < Minitest::Test
  include TestGroupdate

  def conn
    @@conn ||=
      begin
        Mysql2::Client.new(host: "localhost", username: "root", database: "groupdate_test", database_timezone: :utc)
      end
  end

  def assert_result(function, expected, time_str, time_zone = false)
    # skip if no time zone
    if time_zone
      assert_sql expected, "SELECT #{function}('#{time_str}', 'America/Los_Angeles')"
    else
      skip "MySQL does not support function overloading"
    end
  end
end
