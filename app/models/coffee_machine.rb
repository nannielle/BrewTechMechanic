class CoffeeMachine < ApplicationRecord
  belongs_to :user
  belongs_to :coffee_machine_model
  validates :machine_type, presence: true
end