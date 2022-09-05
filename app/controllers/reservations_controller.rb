class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: %i[create new]

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.room = @room
    if @reservation.save
      redirect_to new_room_reservation_path(@reservation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def update
  #   @reservation = Reservation.find(params[:id])
  #   if @reservation.update(reservation_id)
  #     redirect_to(@reservation)
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   @reservation = Reservation.find(params[:id])
  #   Reservation.destroy
  #   redirect_to reservation_path(@reservation), status: :see_other
  # end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_time, :end_time, :user_id)
  end

  def room_params
    params.require(:room).permit(:price, :date, :room_size,
                                 :room_type, :description, :total_occupancy,
                                 :studio_id, :user_id)
  end

end
