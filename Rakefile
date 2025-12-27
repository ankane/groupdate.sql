require "rake/testtask"

Rake::TestTask.new do |t|
  t.pattern = "test/**/*_test.rb"
end

task default: :test

namespace :test do
  Rake::TestTask.new(:postgresql) do |t|
    t.pattern = "test/postgresql_test.rb"
  end
  Rake::TestTask.new(:mysql) do |t|
    t.pattern = "test/mysql_test.rb"
  end
end
