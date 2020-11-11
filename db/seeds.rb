# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
categories = %w[chinese italian japanese french belgian]
puts "Importing restaurants"
10.times do
  resto = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    category: categories.sample
  )
  resto.save!
end
puts "Restaurants have been imported"
puts "Importing Reviews"
100.times do
  review = Review.new(
    rating: rand(0..5),
    content: Faker::Restaurant.review,
    restaurant_id: rand(1..10)
  )
  review.save!
end
puts "Reviews have been imported, good to go!"
