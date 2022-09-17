# == Schema Information
#
# Table name: timeslot_reservations
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  start_date     :date
#  reservation_id :bigint           not null
#  timeslot_id    :bigint           not null
#  end_date       :date
#
class TimeslotReservation < ApplicationRecord
  # To make sure reservations are reserved and no 1 else can book it
  belongs_to :reservation
  belongs_to :timeslot
end
