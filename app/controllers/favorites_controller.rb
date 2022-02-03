class FavoritesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new(favorite_params)
    if @favorite.save
      redirect_to user_path(params[:user_id])
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @favorite = Favorite.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @favorite = Favorite.find(params[:id])
  end

  private

  def favorite_params
    params.require(:favorite).permit(:fav_team, :fav_player).merge(user_id: current_user.id)
  end
end
