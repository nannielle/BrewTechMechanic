class QuestionAndAnswersController < ApplicationController
    def index
      @questions = QuestionAndAnswer.all
    end
end
