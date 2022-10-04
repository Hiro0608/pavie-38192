class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to reservation_path(@comment.reservation)
    else
      @reservation = @comment.reservation
      @comments = @reservation.comments
      render "reservations/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, reservation_id: params[:reservation_id])
  end
end
