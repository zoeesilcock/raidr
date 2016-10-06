class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: session_params[:email]).try(:authenticate, session_params[:password])

    if user
      session[:user_id] = user.id
      redirect_to root_url
    else
      @user = User.new(email: session_params[:email])
      @error = I18n.t('sessions.new.login_failed')
      render :new
    end
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
