class Timeslot < ApplicationRecord
  has_many :room_cofig
  has_many :reservations, dependent: :destroy
end
