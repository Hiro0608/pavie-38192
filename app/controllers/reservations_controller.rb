class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  
  def index
    @reservations = Reservation.includes(:user)
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @reservation.comments
  end

  def edit
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to reservation_path(@reservation)
    else
      render :edit
    end
  end

  def destroy
    if @reservation.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:title, :place, :introduction, :image).merge(user_id: current_user.id)
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @reservation.user
  end
end