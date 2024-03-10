class CreateErrors < ActiveRecord::Migration[7.1]
  def change
    create_table :errors do |t|
      t.text :textdescription
      t.string :youtubelink
      t.references :coffee_machine_model, null: false, foreign_key: true

      t.timestamps
    end
  end
end
