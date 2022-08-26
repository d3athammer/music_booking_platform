class StudiosController < ApplicationController
  before_action :set_studio, only: %i[ show edit update destroy]

  def index
    @studio = Studio.all
  end

  def host
    @owner = @studio.host_name
  end

  def show

  end

  def new
    @studio = Studio.new
  end

  def edit

  end


end
