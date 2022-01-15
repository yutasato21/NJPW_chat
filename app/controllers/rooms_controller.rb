class RoomsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_room, only: :show

  def index
    @rooms = Room.includes(:user).order('created_at DESC')
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

  def show
  end

  def edit
    
  end

  def update
    
  end

  private

  def room_params
    params.require(:room).permit(:name, :text, :image).merge(user_id: current_user.id)
  end

  def set_room
    @room = Room.find(params[:id])
  end
end
