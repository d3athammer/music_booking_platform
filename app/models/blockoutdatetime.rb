# == Schema Information
#
# Table name: blockoutdatetimes
#
#  id          :bigint           not null, primary key
#  day_of_week :string
#  day         :string
#  timeslot_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Blockoutdatetime < ApplicationRecord
  belongs_to :timeslot
end
