class UnfollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.unfollow!(params[:account_id])
    redirect_to root_path, notice:"フォローを外しました！"
  end
end