# == Schema Information
#
# Table name: equipment
#
#  id          :bigint           not null, primary key
#  name        :string
#  brand       :string
#  type        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  studio_id   :bigint           not null
#
class Equipment < ApplicationRecord
  belongs_to :room
  validates :name, :brand, :type, :description, presence: true
  validates :name, length: { maximum: 100 }
end
