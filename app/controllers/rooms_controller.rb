class RoomsController < ApplicationController
  def index
    @rooms = Room.includs(:room)
  end
end
