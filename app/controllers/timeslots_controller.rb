class TimeslotsController < ApplicationController
  def new
    @timeslot = Timeslot.new
  end

  def create
    @timeslot = Timeslot.new(studio_params)
    @timeslot.user = current_user
    if @studio.save
  end

  private

  def timeslot_params
    params.require(:studio).permit(:start_time)
  end
end
