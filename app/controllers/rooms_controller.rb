class RoomsController < ApplicationController
  def index
    @rooms = Room.includes(:room)
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
    params.require(:room).permit(:name, :text, user_ids: [])
  end
end
