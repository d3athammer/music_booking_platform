class Studio < ApplicationRecord
  has_many :rooms
  validates :address, length: { in: 10..150 }
  validates :address, :postal, presence: true
  # allows us to call: @studio.user
  # belongs_to :owner, class_name: "user", foreign_key: "user_id"
  belongs_to :user
  # validate_associate :user
end
