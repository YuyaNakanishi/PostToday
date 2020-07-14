class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    fashion = Fashion.find(params[:fashion_id])
    fashion.likes.create!(user_id: current_user.id)
    redirect_to root_path, notice:"いいねしました"
  end
end
