class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @studio = Studio.all
    @room = Room.all
    @timeslot_reservations = TimeslotReservation.all
    @timeslots = Timeslot.all
    @timeslot_array = []
    @timeslots.each do |time|
      @timeslot_array << [time.time, time.id]
    end

    @hour_array = hourly_array
    # @timeslot_array = []
    # @timeslot.timeslot.each do |time|
    # @timeslot_array << [time.time, time.id]
  end

  private

  def hourly_array
    @hour_array = []
    time = 1
    23.times do
      if time <= 1
        @hour_array << ["#{time} hour", time]
        time += 0.5
      else
        @hour_array << ["#{time} hours", time]
        time += 0.5
      end
    end
    return @hour_array
  end
end
