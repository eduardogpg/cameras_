# == Schema Information
#
# Table name: cameras
#
#  id         :integer          not null, primary key
#  working    :integer
#  fs         :integer
#  kind       :integer
#  place_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class CameraTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
