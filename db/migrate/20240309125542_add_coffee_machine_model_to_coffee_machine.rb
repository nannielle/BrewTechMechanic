class AddCoffeeMachineModelToCoffeeMachine < ActiveRecord::Migration[7.1]
  def change
    add_reference :coffee_machines, :coffee_machine_model, null: false, foreign_key: true
  end
end
