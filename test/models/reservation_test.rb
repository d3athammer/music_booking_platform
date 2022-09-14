# == Schema Information
#
# Table name: reservations
#
#  id             :bigint           not null, primary key
#  start_time     :string
#  price_per_hour :integer
#  duration       :integer
#  status         :boolean
#  user_id        :bigint           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  timeslot_id    :bigint
#  room_id        :bigint           not null
#  start_date     :date
#  end_time       :string
#  end_date       :date
#
require "test_helper"

class ReservationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
