class Reservation < ApplicationRecord
  validates :start_time, :end_time, :price_per_hour, :num_hours, :status, presence: true
  belongs_to :user
  belongs_to :studio
  validates :start_time, comparison: { less_than: :end_time }
end
