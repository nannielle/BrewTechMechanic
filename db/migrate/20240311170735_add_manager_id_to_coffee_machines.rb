class AddManagerIdToCoffeeMachines < ActiveRecord::Migration[7.1]
  def change
    add_reference :coffee_machines, :manager, foreign_key: true, null: true
  end
end
