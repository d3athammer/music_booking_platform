class RoomsController < ApplicationController
  before_action :set_studio, only: %i[show new create]
  before_action :set_room, only: %i[edit update destroy]
  before_action :type_room, only: %i[new create edit update]

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def index
    @rooms = Room.all
  end

  def create
    @room = Room.new(room_params)
    @room.studio = @studio
    if @room.save
      redirect_to studio_path(@studio)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # @type = {['Jamming Studio'], ['Recording Studio'], ['Home Studio'], ['practice room']}
  end

  def update
    @room.update(room_params)
    # access @studio id via room studio instead of set_studio
    @studio = @room.studio
    redirect_to studio_room_path(@studio, @room)
  end

  def destroy
    @studio = @room.studio
    @room.destroy
    redirect_to studio_path(@studio), status: :see_other
  end

  private

  def type_room
    @room_type = [['Jamming Studio'], ['Recording Studio'], ['Home Studio'], ['practice room']]
  end

  def set_room
    @room = Room.find(params[:id])
  end

  def set_studio
    @studio = Studio.find(params[:studio_id])
  end

  def room_params
    params.require(:room).permit(:room_name, :price, :date, :room_size,
                                 :room_type, :description, :total_occupancy)
  end
end
