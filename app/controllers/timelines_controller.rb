class TimelinesController < ApplicationController
  before_action :authenticate_user!
  before_action :profile
  before_action :loginuser_profile

  def show
    user_ids = current_user.followings.pluck(:id)
    @fashions = Fashion.where(user_id: user_ids)
  end



  private

  def loginuser_profile
    if user_signed_in?
      @loginuser_profile = current_user.profile
    end
  end

  def profile
    if user_signed_in?
      @profile = current_user.profile
    end
  end
end