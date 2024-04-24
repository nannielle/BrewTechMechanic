# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  after_action :failed_login_attempt, only: :create

  private

  def failed_login_attempt
    if failed_login?
      raise
      flash.now[:alert] = "Invalid email or password. Please try again."
      render partial: 'shared/login_modal.html.erb'
    end
  end

  def failed_login?
    (options = env["warden.options"]) && options[:action] == "unauthenticated"
  end



  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
