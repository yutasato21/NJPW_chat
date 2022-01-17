class CommentsController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
    @comments = @room.comments.includes(:user)
    @comment = Comment.new
  end

  def create
    
  end
end
