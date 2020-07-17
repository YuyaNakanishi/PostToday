class TimelinesController < ApplicationController
  before_action :authenticate_user!
  before_action :profile
  before_action :profile_layout

  def show
    user_ids = current_user.followings.pluck(:id)
    @fashions = Fashion.where(user_id: user_ids)
  end



  private

  def profile_layout
    if user_signed_in?
      @profile_layout = current_user.profile
    end
  end

  def profile
    if user_signed_in?
      @profile = current_user.profile
    end
  end
end