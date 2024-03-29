class SupportController < ApplicationController

  def create
    redirect_to home_after_login_path, notice: 'We will contact you as soon as possible!'
    # Logic to handle form submission
    # For example, send an email or save the contact inquiry
  end

  def contact_manufacture
    # Your logic to handle the contact form submission goes here
  end
end
