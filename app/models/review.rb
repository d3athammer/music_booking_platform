# == Schema Information
#
# Table name: reviews
#
#  id             :bigint           not null, primary key
#  comment        :string
#  rating         :integer
#  reservation_id :bigint           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Review < ApplicationRecord
  belongs_to :reservation
  # allows us to do @review.reservation
  validates :content, :rating, presence: true
  validates :content, length: { maximum: 500 }
  validates :rating, length: { in: 1..5 }
end
