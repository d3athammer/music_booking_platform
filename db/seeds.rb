# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require 'database_cleaner'
DatabaseCleaner.clean_with(:truncation)
Timeslot.delete_all
Room.delete_all
Studio.delete_all
User.delete_all

5.times do
  # create user
  user = User.new(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: Faker::Alphanumeric.alpha(number: 10)
  )
  # create studio
  studio = Studio.new(
    name: Faker::Company.name,
    address: Faker::Address.street_address,
    postal: Faker::Address.postcode,
    description: Faker::Quote.matz
  )
  # save user into studio.user
  studio.user = user
  studio.save!
  # create 10 rooms inside each studio
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
    # set studio room to studio
    room.studio = studio
    room.save!
  end
  # this will save each studio with 10rooms for each user
  studio.save!
end

# seeding timeslot
seconds = 0000
48.times do
  timeslot = Timeslot.new(
    start_time_in_seconds: seconds,
    time: Time.at(seconds).utc.strftime("%H:%M")
  )
  timeslot.save!
  seconds += 1800
end
