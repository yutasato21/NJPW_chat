class RoomsController < ApplicationController
  def index
    @rooms = Room.includes(:room)
  end

  def new
    @room = Room.new
  end
end
