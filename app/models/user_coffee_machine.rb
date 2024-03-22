class UserCoffeeMachine < ApplicationRecord
  belongs_to :user
  belongs_to :manager
  belongs_to :coffee_machine
end
