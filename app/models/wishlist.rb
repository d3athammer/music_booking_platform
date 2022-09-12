# == Schema Information
#
# Table name: wishlists
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  studio_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Wishlist < ApplicationRecord
  belongs_to :user
  belongs_to :studio
end
