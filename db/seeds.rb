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

puts 'Cleaning records...'

UserCoffeeMachine.destroy_all
ErrorMessage.destroy_all
Review.destroy_all
QuestionAndAnswer.destroy_all
CoffeeMachine.destroy_all
Manager.destroy_all
CoffeeMachineModel.destroy_all

puts 'Cleaning users...'

User.destroy_all

puts "Creating 10 fake Users"

10.times.map do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "securepassword",
    address: "#{Faker::Address.street_address}",
    city: "#{Faker::Address.city}",
    phone_number: Faker::PhoneNumber.cell_phone
  )
end

coffee_machine_models = ["1", "2", "3", "4", "5", "6", "7", "8"]
coffee_machine_models.each do |model_name|
  CoffeeMachineModel.find_or_create_by!(name: model_name)
end

puts CoffeeMachineModel.pluck(:id)
#coffee_machine_model_ids = CoffeeMachineModel.pluck(:id)

# Seed data for managers
Manager.create(
    region: Faker::Address.community,
    name: Faker::Name.name,
    phone_number: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.email
  )

puts "Creating Coffee Machines"
file_path = Rails.root.join('db', 'coffee_machines.yml')
coffee_machines_data = YAML.load_file(file_path)["coffee_machines"]

coffee_machine_photos = ["https://res.cloudinary.com/da6azjfr5/image/upload/v1711391356/m200_profile_redline_frontale_trasp_usodob.jpg",
  "https://res.cloudinary.com/da6azjfr5/image/upload/v1711390192/m23_up_2_gruppi_fronte_bianca_qgpbhh.jpg",
  "https://res.cloudinary.com/da6azjfr5/image/upload/v1711390155/m21junior_dt1_listino_no-sfondo-2_wxodms.jpg",
  "https://res.cloudinary.com/da6azjfr5/image/upload/v1711390100/m39_re_fronte_trasp-2_uez25f.jpg",
  "https://res.cloudinary.com/da6azjfr5/image/upload/v1711390063/7_s-lite_b_frontale_trasp_ebkerj.jpg",
  "https://res.cloudinary.com/da6azjfr5/image/upload/v1711389974/s30-cs10_jby4zz.jpg",
  "https://res.cloudinary.com/da6azjfr5/image/upload/v1711389952/immagine_gamma_s60_with_turbosteam-2_iufyjj.jpg",
  "https://res.cloudinary.com/da6azjfr5/image/upload/v1711390333/m40_2_gruppi_bianca_frontale_trasp-2_vhdggd.jpg"]

coffee_machines_data.each_with_index do |coffee_machine_data, i|
  coffee_machine = CoffeeMachine.new(
    # name: coffee_machine_data["name"],
    coffee_machine_model: CoffeeMachineModel.all[coffee_machine_data["coffee_machine_model_id"]],
    description: coffee_machine_data["description"],
    machine_type: coffee_machine_data["type"]
  )
  file = URI.open(coffee_machine_photos.sample)
  coffee_machine.photo.attach(io: file, filename: "coffee_machine#{i}.jpg", content_type: "image/jpg")

  coffee_machine.save!
end

puts "Creating Error Messages"
file_path = Rails.root.join('db', 'error_messages.yml')
error_messages_data = YAML.load_file(file_path)["error_messages"]

error_messages_data.each do |error_message_data|
  error_message = ErrorMessage.new(
    error_code: error_message_data["error_code"],
    error_name: error_message_data["error_name"],
    youtubelink: error_message_data["youtubelink"],
    textdescription: error_message_data["description"],
    coffee_machine_model: CoffeeMachineModel.all.sample
  )
  error_message.save!
end


puts "Creating Questions and Answers"
file_path = Rails.root.join('db', 'qa.yml')
questions_and_answers_data = YAML.load_file(file_path)

questions_and_answers_data.each do |q_and_a|
  QuestionAndAnswer.find_or_create_by!(question: q_and_a['question'], answer: q_and_a['answer'], coffee_machine_model: CoffeeMachineModel.first)
end

puts "Creating reviews"
# Seed data for reviews
10.times do
  Review.create(
    content: Faker::Lorem.paragraph,
    question_and_answer_id: QuestionAndAnswer.pluck(:id).sample,
    user_id: User.pluck(:id).sample
  )
end





#    puts 'Creating user...'
#    User.create!(
#      #id: 1,
#      email: 'nina@gmail.com',
#      password: '123456',
#      first_name: 'Nina',
#      last_name: 'Asir',
#      address: 'Einsteinstrasse 3',
#      city: 'Berlin',
#      phone_number: '004911111111'
#    )


# Seed data for errors
# 10.times do
#  ErrorMessage.create(
#    textdescription: Faker::Lorem.sentence,
#    youtubelink: Faker::Internet.url,
#    coffee_machine_model: CoffeeMachineModel.all.sample
#  )
# end
