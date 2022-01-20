class MatchesController < ApplicationController
  def new
    @room = Room.find(params[:room_id])
    @match = Match.new
  end

  def create
    @room = Room.find(params[:room_id])
    @match = @room.matches.new(match_params)
   if @match.save
     redirect_to room_path(params[:room_id])
   elsif 
     render :new
   end
  end

  private

  def match_params
    params.require(:match).permit(:game_number, :team_a_player, :team_a_player2, :team_a_player3, :team_a_player4, :team_a_player5, :team_b_player, :team_b_player2, :team_b_player3, :team_b_player4, :team_b_player5)
  end
end
