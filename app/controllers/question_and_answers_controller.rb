class QuestionAndAnswersController < ApplicationController
    def index
      @questions = QuestionAndAnswer.all
      @search_word = params[:query]
      if params[:query].present?
        sql_subquery = "question ILIKE :query OR answer ILIKE :query"
        @questions = @questions.where(sql_subquery, query: "%#{params[:query]}%")
      end
    end
end
