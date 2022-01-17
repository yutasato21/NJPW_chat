class CommentsController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
    @comments = @room.comments.includes(:user)
    @comment = Comment.new
  end

  def create
    @room = Room.find(params[:room_id])
    @comment = @room.comments.new(comment_params)
    if @comment.save(content: params[:content])
      render json:{ comment: @comment }
    else
      @comments = @room.comments.includes(:user)
      render :index
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end
end
