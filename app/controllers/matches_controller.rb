class MatchesController < ApplicationController
  def new
    @room = Room.find(params[:room_id])
    @match = Match.new
  end

  def create
    
  end
end
