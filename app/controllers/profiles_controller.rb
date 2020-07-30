class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :profile
  before_action :loginuser_profile

  def show
    @profile = current_user.profile
  end

  def edit
    @profile = current_user.build_profile
  end

  def update
    @profile = current_user.build_profile(profile_params)
    @profile.assign_attributes(profile_params)
    if @profile.save
      redirect_to profile_path(@fashion),notice:"プロフィールを変更しました"
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(
      :nickname,
      :introduction,
      :avatar)
  end


  def profile
    if user_signed_in?
      @profile = current_user.profile
    end
  end

  def loginuser_profile
    if user_signed_in?
      @loginuser_profile = current_user.profile
    end
  end

end
