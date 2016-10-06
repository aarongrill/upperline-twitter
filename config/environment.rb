require 'bundler'
Bundler.require

configure :development do
  set :database, "sqlite3:twtterdb/database.db"
end
