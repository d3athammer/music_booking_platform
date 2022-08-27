class Studio < ApplicationRecord
  validates :address, :price, :date_availability, :time_availability,
            :room_size, :room_type, :description, :total_occupancy, presence: true
  has_many :reservations, dependent: :destroy
  belongs_to :user
  validates :description, length: { in: 150..500 }
  validates :address, length: { in: 10..150 }
  validates :price, :room_size, :room_type, :total_occupancy, :price_per_hour, numericality: { only_integer: true }
  validates_associated :users
end
