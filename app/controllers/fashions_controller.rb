class FashionsController < ApplicationController
  def index
    @fashions = Fashion.all
  end
end