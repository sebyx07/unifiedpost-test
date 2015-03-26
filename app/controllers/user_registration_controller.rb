class UserRegistrationController < ApplicationController
  def index
    @user_registration_form = UserRegistrationBuilder.new
  end

  def index_post
    @user_registration_form = UserRegistrationBuilder.new(
        user: user_params
    )
    if @user_registration_form.save_models
      redirect_to user_registration_confirm_path @user_registration_form.user
    else
      flash[:error] = @user_registration_form.errors
      render :index
    end
  end

  def confirm
    @user = User.find_by(id: params[:user_id])

    unless @user
      render_404
    end
  end


  def accept

  end

  def decline
    @user = User.find_by(id: params[:user_id])
    @user.destroy
    @user_registration_form = UserRegistrationBuilder.new(user: @user.attributes)
    render :index
  end

  def cities
    city_service = CitiesService.instance
    render json: city_service.get_cities_names(params['country_id'])
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :email_confirmation, :country_id, :city)
  end

end