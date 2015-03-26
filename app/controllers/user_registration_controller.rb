class UserRegistrationController < ApplicationController
  def index
    @user_registration_form = UserRegistrationBuilder.new
  end
end