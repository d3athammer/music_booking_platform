# == Schema Information
#
# Table name: equipment
#
#  id          :bigint           not null, primary key
#  name        :string
#  brand       :string
#  type        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  studio_id   :bigint           not null
#
require "test_helper"

class EquipmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
