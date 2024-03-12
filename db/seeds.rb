# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'
require "open-uri"
require "yaml"

puts "Creating 10 fake Users"

10.times.map do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "securepassword",
    address: "#{Faker::Address.street_address}",
    city: "#{Faker::Address.city}",
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
    phone_number: Faker::PhoneNumber.cell_phone
  )
end

# Seed data for coffee_machine_models
5.times do
  CoffeeMachineModel.create(name: Faker::Name.name)
end

# Seed data for coffee_machines
10.times do
  CoffeeMachine.create(
    UniqueLoginCode: Faker::Code.unique.asin,
    serial_number: Faker::Alphanumeric.alphanumeric(number: 10),
    description: Faker::Lorem.paragraph,
    user_id: User.pluck(:id).sample,
    coffee_machine_model_id: CoffeeMachineModel.pluck(:id).sample
  )
end

# Seed data for errors
10.times do
  Error.create(
    textdescription: Faker::Lorem.sentence,
    youtubelink: Faker::Internet.url,
    coffee_machine_model_id: CoffeeMachineModel.pluck(:id).sample
  )
end

# Seed data for managers
5.times do
  Manager.create(
    region: Faker::Address.community,
    name: Faker::Name.name,
    phone_number: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.email
  )
end

# Seed data for question_and_answers
10.times do
  QuestionAndAnswer.create(
    question: Faker::Lorem.question,
    answer: Faker::Lorem.paragraph,
    coffee_machine_model_id: CoffeeMachineModel.pluck(:id).sample
  )
end

# Seed data for reviews
10.times do
  Review.create(
    content: Faker::Lorem.paragraph,
    question_and_answer_id: QuestionAndAnswer.pluck(:id).sample,
    user_id: User.pluck(:id).sample
  )
end
