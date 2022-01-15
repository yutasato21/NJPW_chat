class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_room, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit, :destroy]

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
    if @room.update(room_params)
      redirect_to room_path
    else
      render :edit
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end

  private

  def room_params
    params.require(:room).permit(:name, :text, :image).merge(user_id: current_user.id)
  end

  def set_room
    @room = Room.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == @room.user_id
  end
end
