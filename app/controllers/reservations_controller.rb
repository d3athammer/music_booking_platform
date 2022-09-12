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
    @start_time = Timeslot.find(@reservation.timeslot_id).time
    # covert start time and date into datetime
    # add duration to start time in datetime (to prevent overnight booking bug)
    # convert end time and date back
    @time = DateTime.parse "#{@reservation.date}T#{@start_time}.00+08:00"
    # @time = Time.new(params[:reservation]["date(1i)"],
    #                  params[:reservation]["date(2i)"],
    #                  params[:reservation]["date(3i)"],
    #                  @start_time)
    @end_time =
    @reservation.room = @room
    @reservation.user = current_user
    @reservation.end_time = @end_time
    raise
    if @reservation.save
      TimeslotReservations.create(date: @reservation.date,
                                  timeslot_id:,
                                  reservation_id: params[:id],
                                  user_id: @reservation.user)
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

  def create_datetime
    @time = Time.new(params[:reservation]["date(1i)"],
                     params[:reservation]["date(2i)"],
                     params[:reservation]["date(3i)"],
                     @start_time)
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
