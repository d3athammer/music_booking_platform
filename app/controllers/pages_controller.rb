class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @studio = Studio.all
    @room = Room.all
    @timeslot_reservations = TimeslotReservation.all
    @timeslots = Timeslot.all
    # @timeslot_array = []
    # @timeslot.timeslot.each do |time|
    # @timeslot_array << [time.time, time.id]
  end

end
