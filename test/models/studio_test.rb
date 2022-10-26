# == Schema Information
#
# Table name: studios
#
#  id          :bigint           not null, primary key
#  address     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  name        :string
#  user_id     :bigint
#  postal      :integer
#  description :string
#
require "test_helper"

class StudioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
