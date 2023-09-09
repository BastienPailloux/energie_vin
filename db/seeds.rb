require 'faker'
require 'open-uri'

Bottle.all.each do |bottle|
  bottle.photo.purge
end

User.all.each do |user|
  user.photo.purge
end

puts 'Destroying Sells'
Sell.destroy_all
puts 'Destroying Websites'
Website.destroy_all
puts 'Destroying Ratings'
Rating.destroy_all
puts 'Destroying Bottles'
Bottle.destroy_all
puts 'Destroying Searches'
Search.destroy_all
puts 'Destroying Users'
User.destroy_all

puts 'creating bottles'
20.times {
  bottle = Bottle.new(
    name: Faker::Beer.name,
    wine_type: ['red', 'pink', 'white', 'champagne'].sample,
    property: Faker::Address.city,
    year: rand(1950...2023)
  )
  case bottle.wine_type
  when "red"
    bottle.photo.attach(io: URI.open('images/red.png'), filename: 'red.png')
  when "white"
    bottle.photo.attach(io: URI.open('images/white.png'), filename: 'white.png')
  when "pink"
    bottle.photo.attach(io: URI.open('images/pink.png'), filename: 'pink.png')
  when "champagne"
    bottle.photo.attach(io: URI.open('images/champagne.png'), filename: 'champagne.png')
  else
    "error"
  end
  bottle.save!
  puts "#{bottle.name} created"
}

puts 'creating users'
10.times {
  user = User.new(
    name: Faker::Name.first_name,
    profile: 'expert',
    email: Faker::Internet.email(name: :name),
    password: '123456'
  )
  user.photo.attach(io: URI.open('images/avatar.jpg'), filename: 'avatar.jpg')
  user.save!
  puts "#{user.name} created"
}

puts 'creating websites'
vinatis = Website.new(
  name: 'Vinatis',
  url: 'https://www.vinatis.com/'
)
vinatis.save!
puts "#{vinatis.name} created"

wineandco = Website.new(
  name: "WineandCo",
  url: "https://www.wineandco.com/"
)
wineandco.save!
puts "#{wineandco.name} created"

nicolas = Website.new(
  name: 'Nicolas',
  url: 'https://www.nicolas.com'
)
nicolas.save!
puts "#{nicolas.name} created"

puts 'creating sells'
1000.times {
  sell = Sell.new(
    price: rand(2...2000),
    website: Website.all.sample,
    bottle: Bottle.all.sample
  )
  sell.save!
}

puts 'creating ratings'
50.times {
  rating = Rating.new(
    rate: rand(0...5),
    comment: Faker::Restaurant.review,
    bottle: Bottle.all.sample,
    user: User.all.sample
  )
  rating.save!
}
