class StudiosController < ApplicationController
  before_action :set_studio, only: %i[show edit update destroy]

  def index
    # if only search is present
    # covert start time and date into datetime
    if params[:query].present?
<<<<<<< HEAD
      @studios = policy_scope(Studio).where("name ILIKE ?", "%#{params[:query]}%")
=======
      @studios = Studio.where("name ILIKE ?", "%#{params[:query]}%")
>>>>>>> aef511ff84e957c712fb8e04270600b65430e568
    elsif params[:date].present? && params[:time].present? && params[:duration].present?
      start_time = Timeslot.find(params[:time]).time unless params[:time].blank?
      start_datetime = DateTime.parse "#{params[:date]}T#{start_time}+08:00"
      end_datetime = start_datetime + (params[:duration].to_i / 24r)
      date_timeslots_hash = timeslots_by_day(start_datetime, end_datetime)
      # timeslot_id_array has nested array of [[date, time],[date,time]]
      timeslot_id_array = find_timeslot_id(date_timeslots_hash)
      room_ids = Room.where(
        <<-SQL
          rooms.id NOT IN (
            SELECT room_id
            FROM timeslot_reservations
            WHERE timeslot_reservations.date = \'#{params[:date]}\'
            AND timeslot_reservations.timeslot_id IN (#{timeslot_id_array.map(&:last).join(', ')})
          )
        SQL
      ).pluck(:id)
<<<<<<< HEAD
      @studios = policy_scope(Studio).joins(:rooms).where("rooms.id IN (#{room_ids.join(', ')})").distinct
    else
      @studios = policy_scope(Studio).all
=======
      @studios = Studio.joins(:rooms).where("rooms.id IN (#{room_ids.join(', ')})").distinct
    else
      @studios = Studio.all
>>>>>>> aef511ff84e957c712fb8e04270600b65430e568
    end
    @hour_array = hourly_array
    @timeslot = Timeslot.all
    @timeslot_array = []
    @timeslot.each do |time|
      @timeslot_array << [time.time, time.id]
    end
    @room_count = count_rooms
  end

  def show
    @studio = Studio.find(params[:id])
<<<<<<< HEAD
    authorize(@studio)
=======
>>>>>>> aef511ff84e957c712fb8e04270600b65430e568
    @rooms = @studio.rooms
    if params[:date].present? && params[:time].present? && params[:duration].present?
      start_time = Timeslot.find(params[:time]).time unless params[:time].blank?
      start_datetime = DateTime.parse "#{params[:date]}T#{start_time}+08:00"
      end_datetime = start_datetime + (params[:duration].to_i / 24r)
      date_timeslots_hash = timeslots_by_day(start_datetime, end_datetime)
      # timeslot_id_array has nested array of [[date, time],[date,time]]
      timeslot_id_array = find_timeslot_id(date_timeslots_hash)
      @rooms = @studio.rooms.where(
        <<-SQL
          rooms.id NOT IN (
            SELECT room_id
            FROM timeslot_reservations
            WHERE timeslot_reservations.date = \'#{params[:date]}\'
            AND timeslot_reservations.timeslot_id IN (#{timeslot_id_array.map(&:last).join(', ')})
          )
        SQL
      )
    end
    @timeslot = Timeslot.all

    @hour_array = hourly_array
    # @reservation.total_price = @room.price_per_hour * @reservation.duration
    @timeslot_array = []
    @timeslot.each do |time|
      @timeslot_array << [time.time, time.id]
    end
<<<<<<< HEAD

=======
>>>>>>> aef511ff84e957c712fb8e04270600b65430e568
  end

  def new
    @studio = Studio.new
<<<<<<< HEAD
    authorize(@studio)
=======
>>>>>>> aef511ff84e957c712fb8e04270600b65430e568
  end

  def create
    @studio = Studio.new(studio_params)
    @studio.user = current_user
<<<<<<< HEAD
    authorize(@studio)
=======
>>>>>>> aef511ff84e957c712fb8e04270600b65430e568
    if @studio.save
      redirect_to studio_path(@studio)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
<<<<<<< HEAD
    authorize(@studio)
  end

  def update
    authorize(@studio)
=======
  end

  def update
>>>>>>> aef511ff84e957c712fb8e04270600b65430e568
    @studio.update(studio_params)
    redirect_to studio_path(@studio)
  end

  def destroy
<<<<<<< HEAD
    authorize(@studio)
=======
>>>>>>> aef511ff84e957c712fb8e04270600b65430e568
    @studio.destroy
    redirect_to root_path, status: :see_other
  end

  helper_method :low_price
  helper_method :range_pax

  private

  # generate date:timeslots hashes
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

  def range_pax(studio)
    pax = []
    studio.rooms.each do |room|
      pax << room.total_occupancy
    end
    pax.sort!
    "#{pax.min} to #{pax.max}"
  end

  def low_price(studio)
    price = []
    studio.rooms.each do |room|
      price << room.price
    end
    price.min
  end

  def count_rooms
    room_count = 0
    @studios.each do |studio|
      room_count += studio.rooms.count
    end
    return room_count
  end

  def set_studio
    @studio = Studio.find(params[:id])
  end

  def studio_params
    params.require(:studio).permit(:name, :address, :postal, :description, :user_id)
  end
end

      # elsif params[:equipment].present? && params[:date] == "" && params[:time] == "" && params[:query] == "" && params[:duration] == ""
      # #   # Find by equipment
      #   @studios = Studio.joins(rooms: :equipments).where("equipment.equipment_type ILIKE ?", "%#{params[:equipment]}%")

      # else
      #   sql_query = <<~SQL
      #     studios.name ILIKE :query
      #     AND reservations.start_date ILIKE :query
      #     AND reservations.duration ILIKE :query
      #     AND rooms.equipment_type ILIKE :query
      #   SQL
      #   @studios = Studio.joins(rooms:[:reservations, :equipments]).where(sql_query, query: "%#{params[:query]}%")
      # end
