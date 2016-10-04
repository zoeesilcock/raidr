class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :user_signed_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue StandardError
    nil
  end

  def user_signed_in?
    return true if current_user
  end
end
