class Room < ApplicationRecord
  validates :price_per_hour, :date, :room_size, :room_type,
            :description, :total_occupancy, presence: true
  has_many :reservations, dependent: :destroy
  belongs_to :user
  belongs_to :studio
  validates :description, length: { in: 150..500 }
  validates :address, length: { in: 10..150 }
  validates :price_per_hour, :room_size,
            :total_occupancy, :price_per_hour, numericality: { only_integer: true }
  validates_associated :users
end
