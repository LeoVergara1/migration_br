require 'csv'
require "uri"
require "json"
require "net/http"

table = CSV.parse(File.read("delete_users.csv"), headers: true)

externals = table.map do |row|
  row["external_id"]
end
url = URI("https://rest.iad-05.braze.com/users/delete")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Post.new(url)
request["Content-Type"] = "application/json"
request["Authorization"] = "Bearer 382bb644-98f5-4263-a925-2404857f28f5"

externals_group =  externals.each_slice(50).to_a

externals_group.each do |element|
  request.body = JSON.dump({
    "external_ids": element
  })
  response = https.request(request)
  puts response.read_body
end
