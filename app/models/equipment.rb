# == Schema Information
#
# Table name: equipment
#
#  id             :bigint           not null, primary key
#  name           :string
#  brand          :string
#  description    :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  studio_id      :bigint           not null
#  equipment_type :integer
#
class Equipment < ApplicationRecord
  belongs_to :room
  validates :name, :brand, :type, :description, presence: true
  validates :name, length: { maximum: 100 }

  enum :equipment_type, %i[Piano Keyboard Drums Percussion Guitar Bass Vocals Amplifiers Accessories Audio]
end
