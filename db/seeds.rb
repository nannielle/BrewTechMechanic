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

CoffeeMachineModels = ["Model 1", "Model 2", "Model 3"]
CoffeeMachineModels.each do |model_name|
  CoffeeMachineModel.find_or_create_by!(name: model_name)
end


# Получаем ID всех созданных моделей кофемашин
coffee_machine_model_ids = CoffeeMachineModel.pluck(:id)

# Создаём кофемашины и привязываем их к моделям кофемашин
10.times do
  CoffeeMachine.create!(
    UniqueLoginCode: Faker::Code.unique.asin,
    serial_number: Faker::Alphanumeric.alphanumeric(number: 10),
    machine_type: "traditional",
    description: Faker::Lorem.paragraph,
    user_id: User.pluck(:id).sample, # Предполагаем, что пользователи уже созданы
    coffee_machine_model_id: coffee_machine_model_ids.sample # Случайный выбор из существующих ID моделей
  )
end


# # Seed data for coffee_machine_models
# 5.times do
#   CoffeeMachineModel.create(name: Faker::Name.name)
# end

# # Seed data for coffee_machines
# 10.times do
#   CoffeeMachine.create(
#     UniqueLoginCode: Faker::Code.unique.asin,
#     serial_number: Faker::Alphanumeric.alphanumeric(number: 10),
#     description: Faker::Lorem.paragraph,
#     user_id: User.pluck(:id).sample,
#     coffee_machine_model_id: CoffeeMachineModel.pluck(:id).sample
#   )
# end

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
#10.times do
#  QuestionAndAnswer.create(
#    question: Faker::Lorem.question,
#    answer: Faker::Lorem.paragraph,
#    coffee_machine_model_id: CoffeeMachineModel.pluck(:id).sample
#  )
#end

# Seed data for reviews
10.times do
  Review.create(
    content: Faker::Lorem.paragraph,
    question_and_answer_id: QuestionAndAnswer.pluck(:id).sample,
    user_id: User.pluck(:id).sample
  )
end

# Путь к файлу с данными
file_path = Rails.root.join('db', 'qa.yml')
# Загрузка данных из файла
questions_and_answers_data = YAML.load_file(file_path)

# Добавление вопросов и ответов в базу данных
questions_and_answers_data.each do |q_and_a|
  QuestionAndAnswer.find_or_create_by!(question: q_and_a['question'], answer: q_and_a['answer'])
end
