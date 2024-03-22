class RemoveColumsFromCoffeeMachines < ActiveRecord::Migration[7.1]
  def change
    remove_column :coffee_machines, :user_id
    remove_column :coffee_machines, :UniqueLoginCode
    remove_column :coffee_machines, :serial_number
    remove_column :coffee_machines, :manager_id
  end
end
