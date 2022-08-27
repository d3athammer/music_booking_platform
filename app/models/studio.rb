class Studio < ApplicationRecord
  has_many :rooms
  belongs_to :owner, class_name: "user", foreign_key: "owner_id"
end
