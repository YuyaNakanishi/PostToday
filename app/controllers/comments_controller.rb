class  CommentsController < ApplicationController
  before_action :profile
  def new
    @comment = current_user.comments.build
  end

  def create
    show = current_user.comments.find(params[:fashion_id])
    @comment = current_user.comments.build(comment_params)
    if @comment.save!
      redirect_to fashion_path(show), notice:"コメントしました！"
    else
      flash.now[:error] = "コメントできませんでした"
      render :new
    end
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
end

