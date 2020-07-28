class Api::LikesController < Api::ApplicationController
  before_action :authenticate_user!

  def show
    fashion = Fashion.find(params[:fashion_id])
    like_status = current_user.has_liked?(fashion)
    render json: { hasLiked: like_status }
  end

  def create
    fashion = Fashion.find(params[:fashion_id])
    fashion.likes.create!(user_id: current_user.id)

    render json: {status: 'ok'}
  end

  def destroy
    fashion = Fashion.find(params[:fashion_id])
    like = fashion.likes.find_by!(user_id: current_user.id)
    like.destroy!
    
    render json: {status: 'ok'}
  end
end
