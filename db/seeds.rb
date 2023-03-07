# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
#Booking.destroy_all if Rails.env.development?
#Article.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?
puts "after destroy"

puts "count user: #{User.count}"
#puts "count booking: #{Booking.count}"
#puts "count article: #{Article.count}"


20.times do
  User.create!(
    email: Faker::Internet.email,
    username: Faker::Internet.username,
    password: '123456'
  )
end




















puts "count user: #{User.count}"
#puts "count booking: #{Booking.count}"
#puts "count article: #{Article.count}"
