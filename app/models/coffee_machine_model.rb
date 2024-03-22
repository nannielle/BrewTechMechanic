class CoffeeMachineModel < ApplicationRecord
  has_many :error_messages
  has_many :question_and_answers
  has_many :coffee_machines
end
