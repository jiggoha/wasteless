# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create()

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

address2 = "81 St Marks Pl, New York, NY 10003"
result2 = Geocoder.search(address2).first
posting2 = Posting.create(name: "Xi'an Famous Foods",
												  description: "5 plates of spicy noodles",
												  time: Time.now,
												  address: address2,
												  latitude: result2.latitude,
												  longitude: result2.longitude,
												  address: result2.address,
												  city: result2.city,
												  state: result2.state,
												  state_code: result2.state_code,
												  postal_code: result2.postal_code,
												  country: result2.country,
												  country_code: result2.country_code)

address3 = "321 W 46th St, New York, NY 10036"
result3 = Geocoder.search(address3).first
posting3 = Posting.create(name: "Barbetta",
												  description: "Boxes of Italian food from catering",
												  time: Time.now,
												  address: address3,
												  latitude: result3.latitude,
												  longitude: result3.longitude,
												  address: result3.address,
												  city: result3.city,
												  state: result3.state,
												  state_code: result3.state_code,
												  postal_code: result3.postal_code,
												  country: result3.country,
												  country_code: result3.country_code)

address4 = "11 W 32nd St, New York, NY 10001"
result4 = Geocoder.search(address4).first
posting4 = Posting.create(name: "Red Mango",
												  description: "2 crates of kiwi",
												  time: Time.now,
												  address: address4,
												  latitude: result4.latitude,
												  longitude: result4.longitude,
												  address: result4.address,
												  city: result4.city,
												  state: result4.state,
												  state_code: result4.state_code,
												  postal_code: result4.postal_code,
												  country: result4.country,
												  country_code: result4.country_code)

address5 = "54 Stone St, New York, NY 10004"
result5 = Geocoder.search(address5).first
posting5 = Posting.create(name: "Adrienne's Pizzabar",
												  description: "4 whole pizzas",
												  time: Time.now,
												  address: address5,
												  latitude: result5.latitude,
												  longitude: result5.longitude,
												  address: result5.address,
												  city: result5.city,
												  state: result5.state,
												  state_code: result5.state_code,
												  postal_code: result5.postal_code,
												  country: result5.country,
												  country_code: result5.country_code)
