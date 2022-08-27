class Review < ApplicationRecord
  belongs_to :reservation
  # allows us to do @review.reservation
  validates :content, :rating, presence: true
  validates :content, length: { maximum: 500 }
  validates :rating, length: { in: 1..5 }
end
