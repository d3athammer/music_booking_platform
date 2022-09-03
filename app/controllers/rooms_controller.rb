class RoomsController < ApplicationController
  before_action :set_studio, only: %i[new create]

  def new
    @room = Room.new
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

  private

  def set_studio
    @studio = Studio.find(params[:studio_id])
  end

  def room_params
    params.require(:room).permit(:price, :date, :room_size,
                                 :room_type, :description, :total_occupancy,
                                 :studio_id, :user_id)
  end
end
