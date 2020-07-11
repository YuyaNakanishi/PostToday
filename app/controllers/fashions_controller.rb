class FashionsController < ApplicationController
  def index
    @fashions = Fashion.all
  end

  def new
    @fashion = current_user.fashions.build
  end

  def create
    @fashion = current_user.fashions.build(fashion_params)
    if @fashion.save
      redirect_to root_path,notice: "投稿しました"
    else
      flash.now[:error] = "投稿できませんでした"
      render :new
    end
  end

  def show
    @fashion = Fashion.find(params[:id])
    @name = @fashion.name
    @image = @fashion.image
    @tops = @fashion.tops
    @pants = @fashion.pants
    @shoes = @fashion.shoes
    @other = @fashion.other
    @description = @fashion.description
  end

  def destroy
    @fashion = current_user.fashions.find(params[:id])
    @fashion.destroy!
    redirect_to root_path,notice:"投稿を消去しました"
  end



  private
  
  def fashion_params
    params.require(:fashion).permit(
      :name,
      :tops,
      :pants,
      :shoes,
      :other,
      :description,
      :image)
  end

end