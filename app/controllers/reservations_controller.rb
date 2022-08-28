class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(studio_params, room_params)
    if @reservation.save
      redirect_to reservation_path(@reservation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_id)
      redirect_to(@reservation)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    Reservation.destroy
    redirect_to reservation_path(@reservation), status: :see_other
  end

end
