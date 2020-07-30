class FollowsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    current_user.follow!(params[:account_id])
    redirect_to root_path, notice: "フォローしました！"
  end
end
