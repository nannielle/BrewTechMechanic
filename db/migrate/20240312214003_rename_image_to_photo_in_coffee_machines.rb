class RenameImageToPhotoInCoffeeMachines < ActiveRecord::Migration[7.1]
  def change
    rename_column :coffee_machines, :image, :photo
  end
end
