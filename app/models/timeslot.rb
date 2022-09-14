# == Schema Information
#
# Table name: timeslots
#
#  id                    :bigint           not null, primary key
#  start_time_in_seconds :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  time                  :string
#
class Timeslot < ApplicationRecord
  has_many :timeslot_reservations
  has_many :reservations, through: :timeslot_reservation
end
