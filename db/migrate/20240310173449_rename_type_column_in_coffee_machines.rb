class RenameTypeColumnInCoffeeMachines < ActiveRecord::Migration[7.1]
  def change
    rename_column :coffee_machines, :type, :machine_type
  end
end
