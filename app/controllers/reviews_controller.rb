
class ReviewsController < ApplicationController
  def create

    @question_and_answer = QuestionAndAnswer.find(params[:question_and_answer_id])
    @review = @question_and_answer.reviews.new(review_params)
    @review.user = current_user
    if @review.save!
      redirect_to question_and_answers_path, notice: 'Review was successfully created.'
    else
      render 'question_and_answers/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
