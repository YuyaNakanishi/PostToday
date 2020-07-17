class AccountsController < ApplicationController
  before_action :profile
  before_action :profile_layout

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

  def profile_layout
    if user_signed_in?
      @profile_layout = current_user.profile
    end
  end

end