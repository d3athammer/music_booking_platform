class Studio < ApplicationRecord
  has_many :rooms, dependent: :destroy
  validates :address, length: { in: 10..150 }
  validates :address, :postal, :description, presence: true
  validates :description, length: { in: 10..500 }
  # allows us to call: @studio.user
  # belongs_to :owner, class_name: "user", foreign_key: "user_id"
  belongs_to :user
  # validate_associate :user
end
