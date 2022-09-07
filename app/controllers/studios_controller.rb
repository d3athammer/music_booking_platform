class StudiosController < ApplicationController
<<<<<<< HEAD
  before_action :set_studio, only: %i[show edit update destroy]
=======
  before_action :set_studio, only: %i[show destroy edit update]
>>>>>>> 282a675998b90b995ee4d5d4b1091ea9e8644dea

  def index
    @studio = Studio.all
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

  private

  def set_studio
    @studio = Studio.find(params[:id])
  end

  def studio_params
    params.require(:studio).permit(:name, :address, :postal, :description, :user_id)
  end
end
