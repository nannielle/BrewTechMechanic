class CreateCoffeeMachines < ActiveRecord::Migration[7.1]
  def change
    create_table :coffee_machines do |t|
      t.string :UniqueLoginCode
      t.string :serial_number
      t.string :type
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
