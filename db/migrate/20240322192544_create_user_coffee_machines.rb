class CreateUserCoffeeMachines < ActiveRecord::Migration[7.1]
  def change
    create_table :user_coffee_machines do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :serial_number
      t.references :manager, null: false, foreign_key: true

      t.timestamps
    end
  end
end
