class Room < ApplicationRecord
  validates :price, :date, :room_size, :room_type,
            :description, :total_occupancy, presence: true
  has_many :reservations, dependent: :destroy
  belongs_to :studio
  validates :description, length: { in: 10..500 }
  validates :price, :room_size,
            :total_occupancy, numericality: { only_integer: true }
end
