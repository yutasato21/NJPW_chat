class RoomsController < ApplicationController
  def index
    @rooms = Room.includs(:room)
  end

  def new
    @room = Room.new
  end
end
