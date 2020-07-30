class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :profile 


  def index
    @fashions = current_user.favorite_fashions
  end

private
def profile
  if user_signed_in?
    @profile = current_user.profile
  end
end

end