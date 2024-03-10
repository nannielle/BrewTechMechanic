class CreateManagers < ActiveRecord::Migration[7.1]
  def change
    create_table :managers do |t|
      t.string :region
      t.string :name
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
