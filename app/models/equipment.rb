class Equipment < ApplicationRecord
  belongs_to :studio
  validates :name, :brand, :type, :description, presence: true
  validates :name, length: { maximum: 100 }
end
