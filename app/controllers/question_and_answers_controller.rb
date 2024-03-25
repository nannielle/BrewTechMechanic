class QuestionAndAnswersController < ApplicationController

  def show
    @question_and_answer = QuestionAndAnswer.find(params[:id])
    @reviews = Review.where(question_and_answer_id: @question_and_answer.id)
  end

    def index
      @questions = QuestionAndAnswer.all
      @search_word = params[:query]
      if params[:query].present?
        sql_subquery = "question ILIKE :query OR answer ILIKE :query"
        @questions = @questions.where(sql_subquery, query: "%#{params[:query]}%")
      end
    end

    def create_review
      @question_and_answer = QuestionAndAnswer.find(params[:id])
      @review = @question_and_answer.reviews.new(review_params)
      @review.user = current_user # Assuming you have user authentication
      if @review.save
        redirect_to question_and_answer_path(@question_and_answer), notice: 'Review added successfully.'
      else
        redirect_to question_and_answer_path(@question_and_answer), alert: 'Failed to add review.'
      end
    end

    private

    def review_params
      params.require(:review).permit(:content)
    end
end
