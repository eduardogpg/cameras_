# == Schema Information
#
# Table name: reports
#
#  id         :integer          not null, primary key
#  comments   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  place_id   :integer          not null
#
require "test_helper"

class ReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
