class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @studio = Studio.all
    @room = Room.all
    @timeslot_reservations = TimeslotReservation.all
    @timeslot_array = timeslot_array
    @hour_array = hourly_array
  end

  def show

  end

  private

  def hourly_array
    hour_array = []
    time = 1
    23.times do
      if time <= 1
        hour_array << ["#{time} hour", time]
        time += 0.5
      else
        hour_array << ["#{time} hours", time]
        time += 0.5
      end
    end
    return hour_array
  end

  def timeslot_array
    timeslot_array = []
    timeslot = Timeslot.all
    timeslot.each do |time|
      timeslot_array << [time.time, time.id]
    end
    return timeslot_array
  end

end
