class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @guardian = Guardian.new
  end

  def create
    @user = User.new user_params

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update_attributes update_params
      redirect_to profile_url
    else
      @user = current_user
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :gamertag,
      :password,
      :password_confirmation
    )
  end

  def update_params
    params.require(:user).permit(
      :email,
      :gamertag
    )
  end
end
