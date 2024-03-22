class ChangeErrorsToErrorMessages < ActiveRecord::Migration[7.1]
  def change
    rename_table :errors, :error_messages
  end
end
