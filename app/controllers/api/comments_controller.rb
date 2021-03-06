class  Api::CommentsController < Api::ApplicationController
  before_action :profile
  before_action :profile_layout

  def index
    fashion = Fashion.find(params[:fashion_id])
    comments = fashion.comments
    render json: comments
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.save!

    render json: @comment
  end

  private

  def comment_params
    fashion = Fashion.find(params[:fashion_id])
    params.require(:comment).permit(:comment).merge(fashion_id: fashion.id)
  end

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