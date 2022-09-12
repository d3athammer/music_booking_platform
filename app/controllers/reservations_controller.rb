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
    @hour_array = hourly_array
    @timeslot_array = []
    @timeslot.each do |time|
      @timeslot_array << [time.time, time.id]
    end
  end

  def create
    @timeslot = Timeslot.all
    @reservation = Reservation.new(reservation_params)
    @reservation.timeslot_id = @reservation.start_time
    @start_time = Timeslot.find(@reservation.timeslot_id).time
    # covert start time and date into datetime
    @datetime = DateTime.parse "#{@reservation.start_date}T#{@start_time}+08:00"
    # adding time to calculate @reservation.end_date
    @end_date = @datetime + (@reservation.duration / 24r)
    # assigning all of these into dates and times
    # add the rest of the timeslots based on my duration
    @timeslot_id_array = []
    # query start_time < = or > = of end_time in timeslot table to get id of timeslot
    # create a reservation for each timeslot
    @reservation.end_time = @end_date.strftime("%H:%M")
    @reservation.room = @room
    @reservation.user = current_user
    if @reservation.save
      new_timeslot_reservations(@timeslot_id_array, @reservations)
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

  def new_timeslot_reservations(timeslot_array, reservation)
    # loop through timeslot id(in an array), loop through this array and save each timeslot into timeslots reservations
    timeslot_array.each do |timeslot_id|
      TimeslotReservations.create(
        start_date: reservation.start_date,
        end_date: reservation.end_date,
        timeslot_id:,
        reservation_id: reservation.id,
        user_id: reservation.user
      )
    end
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_time, :duration, :start_date, :timeslot_id)
  end

  def hourly_array
    @hour_array = []
    time = 1
    24.times do
      @hour_array << ["#{time} hour", time]
      time += 0.5
    end
    return @hour_array
  end
end
