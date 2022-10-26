# == Schema Information
#
# Table name: timeslots
#
#  id                    :bigint           not null, primary key
#  start_time_in_seconds :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  time                  :string
#
require "test_helper"

class TimeslotTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
