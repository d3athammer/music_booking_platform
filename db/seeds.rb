# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


require 'faker'


Room.delete_all
Studio.delete_all
User.delete_all

num = [20..100]

5.times do
  user = User.new(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: Faker::Alphanumeric.alpha(number: 10)
  )
  studio = Studio.new(
    name: Faker::Company.name,
    address: Faker::Address.street_address,
    postal: Faker::Address.postcode,
    description: Faker::Quote.matz
  )
  studio.user = user
  studio.save!
  10.times do
    room = Room.new(
      room_name: Faker::FunnyName.two_word_name,
      date: Faker::Date.in_date_period,
      price: [rand(20..100)].sample,
      room_type: Faker::Emotion.noun,
      room_size: 20,
      description: Faker::Quote.matz,
      total_occupancy: rand(2..5)
    )
    room.studio = studio
    room.save!
  end
  studio.save!
end
