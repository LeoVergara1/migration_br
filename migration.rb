require 'pg'
require 'csv'
require './headers.rb'

helper = Helper.new
begin

  con = PG.connect :dbname => 'emarsys', :user => 'postgres',
      :password => 'postgres'

  user = con.user
  db_name = con.db
  pswd = con.pass

  puts "User: #{user}"
  puts "Database name: #{db_name}"
  puts "Password: #{pswd}"

  rs = con.exec "SELECT * FROM users LIMIT 5"
  string_list = "("
  CSV.open("migration.csv", "w") do |csv|
    csv << helper.headers
    map = rs.each do |row|
      csv << helper.map_row(row)
      string_list = string_list + "'#{row['user_id']}',"
    end
  end
  string_list = string_list.chop
  string_list = string_list + ")"
  #p string_list
  #con.exec "Update users set was_migrate=true where user_id in #{string_list}"
rescue PG::Error => e

  puts e.message

ensure

  con.close if con

end
