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
  belongs_to :room, optional: true
  validates :name, :brand, presence: true
  # validates :equipment_type, inclusion: { in: equipment_types.keys }
  validates :name, length: { maximum: 100 }

  enum :equipment_type, %i[piano keyboard drums percussion guitar bass vocals amplifiers accessories audio]
end
