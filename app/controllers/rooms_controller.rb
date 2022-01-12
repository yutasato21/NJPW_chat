class RoomsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @rooms = Room.includes(:user)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, :text, :image).merge(user_id: current_user.id)
  end
end
