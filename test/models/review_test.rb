# == Schema Information
#
# Table name: reviews
#
#  id             :bigint           not null, primary key
#  comment        :string
#  rating         :integer
#  reservation_id :bigint           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
