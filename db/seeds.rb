# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

address = "156 5th Avenue, New York, NY"
result = Geocoder.search(address).first
posting = Posting.create(name: "HudsonHack",
												 description: "Lots and lots of candy and dumplings",
												 time: Time.now,
												 address: address,
												 latitude: result.latitude,
												 longitude: result.longitude,
												 address: result.address,
												 city: result.city,
												 state: result.state,
												 state_code: result.state_code,
												 postal_code: result.postal_code,
												 country: result.country,
												 country_code: result.country_code)