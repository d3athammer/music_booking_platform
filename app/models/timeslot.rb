class Timeslot < ApplicationRecord
  has_many :room_cofig
  has_many :reservations, dependent: :destroy
  validates :start_time, inclusion: { in: %w(0000 0030 0100 0130 0200 0230 0300 0330 0400),
                                      message: "%{value} is not a valid size" }
end
