class MatchesController < ApplicationController
  before_action :set_room, only: [:new, :create]
  before_action :move_to_index, only: :new

  def new
    @match = Match.new
  end

  def create
    @match = @room.matches.new(match_params)
   if @match.save
     redirect_to room_path(params[:room_id])
   elsif 
     render :new
   end
  end

  def edit
    @match = Match.find(params[:id])
  end

  def update
    
  end

  private

  def match_params
    params.require(:match).permit(:game_number, :team_a_player, :team_a_player2, :team_a_player3, :team_a_player4, :team_a_player5, :team_b_player, :team_b_player2, :team_b_player3, :team_b_player4, :team_b_player5)
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == @room.user_id
  end
end
