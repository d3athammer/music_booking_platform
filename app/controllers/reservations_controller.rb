class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: %i[create new]
  # before_action :set_timeslot, only: %i[new create]

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
    @timeslot = Timeslot.all
    @timeslot_array = []
    @timeslot.each do |time|
      @timeslot_array << [time.time, time.id]
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.timeslot_id = @reservation.start_time
    @RT = TimeslotReservation.new(timeslot_id: @reservation.timeslot_id,
                                  date: @reservation.date,
                                  reservation_id: @reservation.id)
    @timeslot = Timeslot.find(params[:id])
    @reservation.room = @room
    @reservation.user = current_user
    @reservation.end_time = @end_time
    raise
    if @reservation.save
      redirect_to room_reservations_path(@room)
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

  def end_time
    # "#{@reservation.start_time}"
    start_time = "00:30"
    @end_time = "#{@reservation.date} #{start_time}".to_datetime
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  # def set_timeslot
  #   @reservation = Reservation.new(reservation_params)
  #   @reservation.timeslot_id = @reservation.start_time
  #   @reservation.timeslot = @timeslot
  #   @timeslot = Timeslot.find(params[:timeslot_id])
  # end

  def reservation_params
    params.require(:reservation).permit(:start_time, :duration, :date, :timeslot_id)
  end

  # def room_params
  #   params.require(:room).permit(:price, :date, :room_size,
  #                                :room_type, :description, :total_occupancy,
  #                                :studio_id, :user_id)
  # end

end
