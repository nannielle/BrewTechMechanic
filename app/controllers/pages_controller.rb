class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home_befor_login]

  def home
  end

  def home_before_login
    redirect_to root_path, notice: "You are already signed in." if user_signed_in?
  end

  def home_after_login
    # Code for the home page after login
  end
end
