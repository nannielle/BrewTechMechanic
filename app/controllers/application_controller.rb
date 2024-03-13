class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  def after_sign_in_path_for(*)
    home_after_login_path # your path
  end
end
