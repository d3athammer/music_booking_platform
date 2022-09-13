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
    # assign timeslot_id by taking the value from @reservation.start_time, which signifies timeslot_id
    @reservation.timeslot_id = @reservation.start_time
    # find actual start_time by going through the list of timeslot_id and time
    @start_time = Timeslot.find(@reservation.timeslot_id).time
    # reassign the start_time so it's in string
    @reservation.start_time = @start_time.strftime("%H:%M")
    # covert start time and date into datetime
    @datetime = DateTime.parse "#{@reservation.start_date}T#{@start_time}+08:00"
    # adding time to calculate @reservation.end_date
    @end_date = @datetime + (@reservation.duration / 24r)
    # assigning end_time to time
    @reservation.end_time = @end_date.strftime("%H:%M")
    # add the rest of the timeslots based on my duration
    @timeslot_id_array = time_span_search(@start_time, @reservation.end_time)
    # if (@start_time < @reservation.end_time) && (@reservation.start_date <= @reservation.end_date)
      # Timeslot.where("time >= :start_time AND time <= :end_time",
      #               { start_time: @start_time, end_time: @reservation.end_time }).or(Timeslot.where(
      #                "time >= '00:00' AND time <= :end_time",
      #               { start_time: "00:00", end_time: @reservation.end_time }
      #               ))
    # (end1 - start1) > (start2 - start1) AND (end2 - start2) > (start1 - start2)

    # create a reservation for each timeslot
    @reservation.room = @room
    @reservation.user = current_user
    raise
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
    23.times do
      if time <= 1
        @hour_array << ["#{time} hour", time]
        time += 0.5
      else
        @hour_array << ["#{time} hours", time]
        time += 0.5
      end
    end
    return @hour_array
  end

  def time_span_search(start_time, end_time)
    Timeslot
      .where('end_time > start_time and start_time <= ? and
              end_time >= ?', end_time, start_time
      )
      .or(
        Timeslot
          .where('end_time <= start_time and start_time <= ? and
                start_time <= ? and end_time >= ? and end_time <= ?', end_time, '23:30', '00:00', start_time)
      )
      .pluck(:id)
  end
end
