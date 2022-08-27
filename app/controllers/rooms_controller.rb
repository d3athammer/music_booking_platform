class RoomsController < ApplicationController
  before_action :set_studio, only: %i[create new show edit update destroy]

  def index
    @studio = Studio.all
  end

  def host
    @owner = @studio.host_name
  end

  def show
  end

  def new
    @room = Room.new
  end

  def edit

  end

  def new

  end

  def create
    @room = Room.new
    @room.user = current_user
    if @studio.save
      redirect_to studio_path(@studio)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_room
    @room = Room.find(params[:studio_id])
  end

end
