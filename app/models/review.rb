class Review < ApplicationRecord
  belongs_to :question_and_answer
  belongs_to :user
end
