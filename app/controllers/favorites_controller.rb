class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :profile 
  before_action :profile_layout

  def index
    @fashions = current_user.favorite_fashions
  end

private
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