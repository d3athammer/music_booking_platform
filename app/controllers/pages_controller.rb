class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @studio = Studio.all
    @room = Room.all
    @timeslot_reservations = TimeslotReservation.all
  end
end
