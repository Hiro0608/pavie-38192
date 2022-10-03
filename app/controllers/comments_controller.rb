class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, reservation_id: params[:reservation_id])
  end
end
