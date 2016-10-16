class GuardiansController < ApplicationController
  def create
    @guardian = Guardian.new user: current_user, guardian_class: guardian_params[:guardian_class]
    @guardian.save
    redirect_to profile_url
  end

  def toggle
    guardian = Guardian.find params[:guardian_id]
    guardian.update_attributes(enabled: !guardian.enabled)
    redirect_to profile_url
  end

  private

  def guardian_params
    params.require(:guardian).permit(:guardian_class)
  end
end
