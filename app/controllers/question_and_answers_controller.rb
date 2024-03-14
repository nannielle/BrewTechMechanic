class QuestionAndAnswersController < ApplicationController
    def index
      @questions_and_answers = QuestionAndAnswer.all
    end
end
