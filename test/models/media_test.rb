# == Schema Information
#
# Table name: media
#
#  id         :bigint           not null, primary key
#  studio_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class MediaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
