# == Schema Information
#
# Table name: studio_media
#
#  id         :bigint           not null, primary key
#  studio_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class StudioMedia < ApplicationRecord
  belongs_to :studio
end
