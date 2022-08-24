class Review < ApplicationRecord
  belongs_to :reservation
  validates :content, :rating, presence: true
  validates :content, length: { maximum: 500 }
  validates :rating, length: { in: 1..5 }
end
