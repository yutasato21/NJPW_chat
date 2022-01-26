class FavoritesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @favorite = Favorite.new
  end

  def create
    
  end
end
