class StudiosController < ApplicationController
  before_action :set_studio, only: %i[show edit update destroy]

  def index
    # if only search is present
    if params[:query].present? && params[:date] == "" && params[:time] == "" && params[:equipment] == "" && params[:duration] == ""
      # Find by studio name
      @studios = Studio.where("name ILIKE ?", "%#{params[:query]}%")
    # if only date is present
    elsif params[:date].present? && params[:query] == "" && params[:time] == "" && params[:equipment] == "" && params[:duration] == ""
      sql_query = <<~SQL
        reservations.start_date <> :start_date
      SQL
      @studios = Studio.joins(rooms: :reservations).where(sql_query, start_date: params[:date]).distinct
    elsif params[:time].present? && params[:query] == "" && params[:time] == "" && params[:equipment] == "" && params[:duration] == ""
  # sql_query = []
    # sql_query << "studios.name ILIKE '#{params[:query]}'" if params[:query].present?
    # sql_query << "date = '#{params[:date]}'" if params[:date].present?
    # sql_query << "start_time = #{params[:start_time]}" if params[:start_time].present?
    # sql_query << "duration = #{params[:duration]}" if params[:duration].present?
    # sql_query << "equipment = #{params[:equipment]}" if params[:equipment].present?

    # if params[:query].present?
    #   @studios = Activity.joins(activity_items: :item).where(sql_query.join(" AND ")).sample(18)
    # else
    # new condition,
    # (params[:date].present? || …._) && Those that you want to allow empty string

    else
      @studios = Studio.all
    end
    @room_count = count_rooms
  end

  def show
    @studio.rooms
  end

  def new
    @studio = Studio.new
  end

  def create
    @studio = Studio.new(studio_params)
    @studio.user = current_user
    if @studio.save
      redirect_to studio_path(@studio)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @studio.update(studio_params)
    redirect_to studio_path(@studio)
  end

  def destroy
    @studio.destroy
    redirect_to studios_path, status: :see_other
  end

  helper_method :low_price
  helper_method :range_pax

  private

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
