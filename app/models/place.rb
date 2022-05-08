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
  has_many :reports

  after_create :create_cameras

  accepts_nested_attributes_for :cameras, update_only: true
  

  def working
    self.cameras.reduce(0) { |sum, camera| sum + camera.working }
  end

  def fs
    self.cameras.reduce(0) { |sum, camera| sum + camera.fs }
  end

  def total
    self.cameras.reduce(0) { |sum, camera| sum + (camera.fs + camera.working) }
  end

  def create_cameras
    (0..4).each { |c|  Camera.create(kind:c, place: self, working:0, fs:0) } unless self.cameras.any?
  end
end
