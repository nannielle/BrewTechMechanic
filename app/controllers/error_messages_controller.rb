class ErrorMessagesController < ApplicationController
  def show
    @error = ErrorMessage.find(params[:id])
  end
end
