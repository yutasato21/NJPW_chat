class CommentsController < ApplicationController
  before_action :set_comment, only: :destroy
  before_action :move_to_index, only: :destroy

  def create
    @room = Room.find(params[:room_id])
    @comment = @room.comments.new(comment_params)
    if @comment.save(content: params[:content])
      render json:{ comment: @comment, user: @comment.user.nickname, time: @comment.created_at.strftime("%H:%M") }
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to room_path(params[:room_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless current_user.id == @comment.user_id
  end
end
