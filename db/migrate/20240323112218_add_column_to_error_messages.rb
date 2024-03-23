class AddColumnToErrorMessages < ActiveRecord::Migration[7.1]
  def change
    add_column :error_messages, :error_code, :string
    add_column :error_messages, :error_name, :string
  end
end
