class RoomsController < ApplicationController
  before_action :set_studio, only: %i[show new create]
  before_action :set_room, only: %i[edit update destroy]
  # before_action :type_room, only: %i[new create edit update]

  def show
    @room = Room.find(params[:id])
<<<<<<< HEAD
    authorize(@room)
  end

  def index
    @rooms = policy_scope(Room)
=======
  end

  def index
    @rooms = Room.all
>>>>>>> aef511ff84e957c712fb8e04270600b65430e568
  end

  def create
    @room = Room.new(room_params)
    @room.studio = @studio
<<<<<<< HEAD
    @room.user_id = current_user.id
    authorize(@room)

=======
>>>>>>> aef511ff84e957c712fb8e04270600b65430e568
    if @room.save
      redirect_to studio_path(@studio)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @room = Room.new
<<<<<<< HEAD
    authorize(@room)
=======
>>>>>>> aef511ff84e957c712fb8e04270600b65430e568
    @room.equipments.build
  end

  def edit
<<<<<<< HEAD
    authorize(@room)
=======
>>>>>>> aef511ff84e957c712fb8e04270600b65430e568
    @room.equipments.build
    # @type = {['Jamming Studio'], ['Recording Studio'], ['Home Studio'], ['practice room']}
  end

  def update
<<<<<<< HEAD
    authorize(@room)
    @room.update(room_params)
    # access @studio id via room studio instead of set_studio
    @studio = @room.studio
    redirect_to studio_path(@studio)
  end

  def destroy
    authorize(@room)
=======
    @room.update(room_params)
    # access @studio id via room studio instead of set_studio
    @studio = @room.studio
    redirect_to studio_room_path(@studio, @room)
  end

  def destroy
>>>>>>> aef511ff84e957c712fb8e04270600b65430e568
    @studio = @room.studio
    @room.destroy
    redirect_to studio_path(@studio), status: :see_other
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def set_studio
    @studio = Studio.find(params[:studio_id])
  end

  def room_params
    params.require(:room).permit(:room_name, :price, :date, :room_size,
                                 :room_type, :description, :total_occupancy,
                                 equipments_attributes: %i[id _destroy room_id equipment_type name brand])
  end
end
