class HomeController < ApplicationController
  def index
    @user = User.new

    if user_signed_in? && current_user.current_group
      redirect_to current_user.current_group
    end
  end
end
