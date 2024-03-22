class CoffeeMachine < ApplicationRecord
  belongs_to :user
  belongs_to :coffee_machine_model
  belongs_to :manager
  has_one_attached :photo
  validates :machine_type, presence: true
end
