class AccountsController < ApplicationController
  before_action :profile
  before_action :loginuser_profile

  def show
    fashion = Fashion.find(params[:id])
    @user = fashion.user
    @profile = @user.profile
    if @user == current_user
      redirect_to profile_path
    end
  end

  private

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