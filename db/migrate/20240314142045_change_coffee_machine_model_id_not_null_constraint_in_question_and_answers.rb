class ChangeCoffeeMachineModelIdNotNullConstraintInQuestionAndAnswers < ActiveRecord::Migration[7.1]
  def change
    change_column_null :question_and_answers, :coffee_machine_model_id, true
  end
end
