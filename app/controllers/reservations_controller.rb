class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    Reservation.create(reservation_params)
  end

  def destroy
    reservation = Reservation.find(params[:id])
    reservation.destroy
  end

  def edit
  end

  def update
    reservation = Reservation.reservation(params[:id])
    reservation.update(reservation_params)
  end

  def show
  end

  private
  def reservation_params
    params.require(:reservation).permit(:image, :title, :place, :introduction).merge(user_id: current_user.id)
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