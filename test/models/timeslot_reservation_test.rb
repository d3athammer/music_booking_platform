# == Schema Information
#
# Table name: timeslot_reservations
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  start_date     :date
#  reservation_id :bigint           not null
#  timeslot_id    :bigint           not null
#  end_date       :date
#
require "test_helper"

class TimeslotReservationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
