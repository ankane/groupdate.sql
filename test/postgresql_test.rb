require "test_helper"

class TestPostgresql < Minitest::Test
  include TestGroupdate

  def conn
    @@conn ||=
      begin
        conn = PG.connect(:dbname => "groupdate_test")
        conn.query File.read("postgresql.sql")
        conn.query "SET time zone 'UTC'"
        conn.type_map_for_results = PG::BasicTypeMapForResults.new(conn)
        conn
      end
  end
end
