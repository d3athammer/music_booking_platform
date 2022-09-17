class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: %i[create new index destroy show]
  # before_action :set_timeslot, only: %i[new create]

  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
    @timeslot = Timeslot.all
    @hour_array = hourly_array
    # @reservation.total_price = @room.price_per_hour * @reservation.duration
    @timeslot_array = []
    @timeslot.each do |time|
      @timeslot_array << [time.time, time.id]
    end
  end

  def create
    @timeslot = Timeslot.all
    @reservation = Reservation.new(reservation_params)
    # assign timeslot_id by taking the value from @reservation.start_time, which signifies timeslot_id
    @reservation.timeslot_id = params[:reservation][:start_time].to_i
    # find actual start_time by going through the list of timeslot_id and time
    @start_time = Timeslot.find(@reservation.timeslot_id).time
    # reassign the start_time so it's in string
    @reservation.start_time = @start_time
    # covert start time and date into datetime
    @start_datetime = DateTime.parse "#{@reservation.start_date}T#{@start_time}+08:00"
    # adding time to calculate @reservation.end_date
    @end_datetime = @start_datetime + (@reservation.duration / 24r)

    @reservation.end_date = @end_datetime
    @reservation.end_time = @end_datetime.strftime("%H:%M")
    # add the rest of the timeslots based on my duration
    @date_timeslots_hash = timeslots_by_day(@start_datetime, @end_datetime)
    # getting [[date_1,timeslot_id1], [date_2,timeslot_id2], etc]
    @date_to_timeslot_id = find_timeslot_id(@date_timeslots_hash)
    @reservation.room = @room
    @reservation.user = current_user

    if @reservation.save
      new_timeslot_reservations(@date_to_timeslot_id, @reservation)
      redirect_to room_reservation_path(@room,@reservation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy

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
    timeslot_array.each do |date, timeslot_id|
      TimeslotReservation.create(
        date:,
        timeslot_id:,
        reservation_id: reservation.id
      )
    end
  end

  def timeslots_by_day(start_datetime, end_datetime)
    (start_datetime.to_i...end_datetime.to_i).step(30.minutes).to_a.each_with_object({}) do |element, memo|
      day = Time.at(element).to_date.strftime('%Y-%m-%d')
      seconds_since_midnight = Time.at(element).seconds_since_midnight.to_i
      memo[day] ||= []
      memo[day] << seconds_since_midnight
    end
  end

  def find_timeslot_id(timeslots_by_day)
    array = []
    timeslots_by_day.each do |date, times|
      # get an array of timeslot_id
      times_in_secs = Timeslot.where(start_time_in_seconds: times).pluck(:id)
      times_in_secs.each do |time|
        array << [date, time]
      end
    end
    return array
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_time, :duration, :start_date, :timeslot_id, :total_price)
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


  # def time_span_search(start_datetime, end_datetime)
  #   start_is = ((start_datetime.min * 60) + (start_datetime.hour * 3600))
  #   end_is = ((end_datetime.min * 60) + (end_datetime.hour * 3600))
  #   if start_is > end_is
  #     Timeslot.where("start_time_in_seconds >= :start_time
  #                   OR start_time_in_seconds < :end_time", { start_time: start_is,
  #                                                            end_time: end_is }).pluck(:id)
  #   else
  #     Timeslot.where("start_time_in_seconds >= :start_time AND
  #                     start_time_in_seconds < :end_time", { start_time: start_is,
  #                                                           end_time: end_is }).pluck(:id)
  #   end
  #   # using start_time to query start time for first day,
  #   # 1st column - date column - query start_time_date, check start_time that >= start_time .or
  #   # = date column = start_time_date + 1
  #   # check if start_time is < end_time
  # end
end
