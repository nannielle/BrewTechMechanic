class CoffeeMachine < ApplicationRecord
  belongs_to :user
  belongs_to :coffee_machine_model
  validates :machine_type, presence: true
  validates :coffee_machine_model_id, presence: true
  has_one_attached :photo
end
