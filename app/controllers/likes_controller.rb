class LikesController < ApplicationController
  before_action :authenticate_user!

  def show
    fashion = Fashion.find(params[:fashion_id])
    like_status = current_user.has_liked?(fashion)
    render json: { hasLiked: like_status }
  end

  def create
    fashion = Fashion.find(params[:fashion_id])
    fashion.likes.create!(user_id: current_user.id)
    redirect_to fashion_path(fashion)
  end

  def destroy
    fashion = Fashion.find(params[:fashion_id])
    like = fashion.likes.find_by!(user_id: current_user.id)
    like.destroy!
    redirect_to fashion_path(fashion)
  end
end
