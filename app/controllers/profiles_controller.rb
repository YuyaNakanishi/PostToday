class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = current_user.profile
  end

  def edit
    @profile = current_user.profile
    @profile = current_user.build_profile
  end

  def update
    @profile = current_user.build_profile
    @profile.update(profile_params)
    redirect_to profile_path(@fashion),notice:"プロフィールを変更しました"
  end

  private
  def profile_params
    params.require(:profile).permit(
      :nickname,
      :introduction,
      :avatar)
  end

end