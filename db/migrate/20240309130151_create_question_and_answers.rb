class CreateQuestionAndAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :question_and_answers do |t|
      t.string :question
      t.text :answer
      t.references :coffee_machine_model, null: false, foreign_key: true

      t.timestamps
    end
  end
end
