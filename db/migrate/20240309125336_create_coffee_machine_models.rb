class CreateCoffeeMachineModels < ActiveRecord::Migration[7.1]
  def change
    create_table :coffee_machine_models do |t|
      t.string :name

      t.timestamps
    end
  end
end
