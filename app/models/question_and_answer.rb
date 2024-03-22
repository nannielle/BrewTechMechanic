class QuestionAndAnswer < ApplicationRecord
  has_many :reviews
  belongs_to :coffee_machine_model
end
