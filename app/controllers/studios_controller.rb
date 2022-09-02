class StudiosController < ApplicationController
  before_action :set_studio, only: %i[show destroy edit]

  def index
    @studio = Studio.all
  end

  def show
  end

  def new
    @studio = Studio.new
  end

  def create
    @studio = Studio.new(studio_params)
    @studio.user = current_user
    if @studio.save
      redirect_to studios_path(@studio)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

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
    params.require(:studio).permit(:name, :address, :user_id)
  end
end
