class RoomsController < ApplicationController
  before_action :set_room, only: %i[new create]

  def new
    @studio = Studio.find(params[:studio_id])
    @room = Room.new
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
