class Equipment < ApplicationRecord
  belongs_to :room
  validates :name, :brand, :type, :description, presence: true
  validates :name, length: { maximum: 100 }
end
