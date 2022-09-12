# == Schema Information
#
# Table name: media
#
#  id         :bigint           not null, primary key
#  studio_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Media < ApplicationRecord
  belongs_to :room
end
