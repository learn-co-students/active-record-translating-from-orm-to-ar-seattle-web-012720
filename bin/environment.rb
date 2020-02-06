require 'bundler/setup'
Bundler.require
require 'rake'
require 'active_record'

require_relative '../lib/dog'
require_relative 'sql_runner'

DB = ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "./db/dogs.db"
)

DB = ActiveRecord::Base.connection

# sql = <<-SQL
# CREATE TABLE IF NOT EXISTS dogs (
#     id INTEGER PRIMARY KEY,
#     name TEXT,
#     breed TEXT
# )
# SQL

if ENV["ACTIVE_RECORD_ENV"] == "test"
  ActiveRecord::Migration.verbose = false
end
