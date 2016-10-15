class GuardiansController < ApplicationController
  def create
    @guardian = Guardian.new user: current_user, guardian_class: guardian_params[:guardian_class]

    if @guardian.save
      redirect_to profile_url
    else
      render 'users/show'
    end
  end

  private

  def guardian_params
    params.require(:guardian).permit(:guardian_class)
  end
end
