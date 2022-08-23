class Studio < ApplicationRecord
  validates :address, :price, :date_availability, :time_availability,
            :room_size, :room_type, :description, :total_occupancy, presence: true
  has_many :reservations, :equipments
end
