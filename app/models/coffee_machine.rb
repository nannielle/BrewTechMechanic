class CoffeeMachine < ApplicationRecord
  belongs_to :coffee_machine_model
  has_one_attached :photo
  has_many :user_coffee_machines
  validates :machine_type, presence: true
end
