class StudiosController < ApplicationController
  # before_action :set_studio, only: %i[create]

  def index
    @studio = Studio.all
  end

  def new
    @studio = Studio.new
  end

  def create
    @studio = Studio.new
    @studio.user = current_user
    if @studio.save
      redirect_to studio_path(@studio)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_studio
    @studio = Studio.find(params[:user_id])
  end

  def studio_params
    params.require(:studio).permit(:name, :address)
  end
end
