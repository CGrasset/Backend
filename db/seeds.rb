# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'net/http'
require 'uri'
require 'json'

# Request data
uri               = URI.parse('https://www.recorrido.cl/api/v2/es/cities.json?country=chile')
request           = Net::HTTP::Get.new(uri)
request['Accept'] = 'application/json'
req_options       = { use_ssl: uri.scheme == 'https' }

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end

# Parse data
cities      = JSON.parse(response.body, symbolize_names: true )[:cities]
columns     = [:url_name, :name, :latitude, :longitude, :country_id]
batch_size  = 500

# Insert data to db
City.import columns, cities, batch_size: batch_size
