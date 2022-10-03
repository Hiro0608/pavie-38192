class ReservationsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show]
  

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
    @reservation = Reservation.find(params[:id])
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
    else
      render :edit
    end
  end

  def destroy
    reservation = Reservation.find(params[:id])
    reservation.destroy
  end

  private

  def reservation_params
    params.require(:reservation).permit(:title, :place, :introduction, :image).merge(user_id: current_user.id)
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end