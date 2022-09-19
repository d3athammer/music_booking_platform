# == Schema Information
#
# Table name: rooms
#
#  id              :bigint           not null, primary key
#  price           :integer
#  room_size       :integer
#  room_type       :string
#  description     :string
#  total_occupancy :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  date            :datetime
#  studio_id       :bigint
#  room_name       :string
#
class Room < ApplicationRecord
  validates :room_name, :price, :room_size, :room_type,
            :description, :total_occupancy, presence: true
  has_many :reservations, dependent: :destroy
  belongs_to :studio
  has_many :equipments, dependent: :destroy
  validates :description, length: { in: 10..500 }
  validates :price, :room_size,
            :total_occupancy, numericality: { only_integer: true }
  accepts_nested_attributes_for :equipments, allow_destroy: true, reject_if: proc { |att| att['name'].blank? }

  enum :room_type, %i[Jamming_Studios Rehearsal_Studio Recording_Studio Home_Studio]

  def room_availability
    # Find the reservations of the rooms
    Room.joins()
    # date into date
    # convert duration to timeslots_id
    # equipment filter by equipment_type
    # Go through the list of available timeslots from timeslot_reservations (room_id, reservation_id, timeslot_id, date)
    # check the timeslots
    # pass info into index search
  end
end
