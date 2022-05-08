# == Schema Information
#
# Table name: places
#
#  id             :integer          not null, primary key
#  name           :string
#  institution_id :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Place < ApplicationRecord
  belongs_to :institution
  has_many :cameras
  
  def working
    self.cameras.reduce(0) { |sum, camera| sum + camera.working }
  end

  def fs
    self.cameras.reduce(0) { |sum, camera| sum + camera.fs }
  end

  def total
    self.cameras.reduce(0) { |sum, camera| sum + (camera.fs + camera.working) }
  end

end
