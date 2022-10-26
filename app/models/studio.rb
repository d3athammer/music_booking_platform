# == Schema Information
#
# Table name: studios
#
#  id          :bigint           not null, primary key
#  address     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  name        :string
#  user_id     :bigint
#  postal      :integer
#  description :string
#
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
