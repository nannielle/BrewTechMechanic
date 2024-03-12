class AddImageToCoffeeMachines < ActiveRecord::Migration[7.1]
  def change
    add_column :coffee_machines, :image, :string
  end
end
