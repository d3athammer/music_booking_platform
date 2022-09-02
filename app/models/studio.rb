class Studio < ApplicationRecord
  has_many :rooms
  # allows us to call: @studio.user
  # belongs_to :owner, class_name: "user", foreign_key: "user_id"
  belongs_to :user
end
