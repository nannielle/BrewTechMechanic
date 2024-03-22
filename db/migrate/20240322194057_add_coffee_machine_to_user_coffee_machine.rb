class AddCoffeeMachineToUserCoffeeMachine < ActiveRecord::Migration[7.1]
  def change
    add_reference :user_coffee_machines, :coffee_machine, foreign_key: true
  end
end
