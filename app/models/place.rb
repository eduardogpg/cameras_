# == Schema Information
#
# Table name: places
#
#  id         :integer          not null, primary key
#  name       :string
#  region_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Place < ApplicationRecord
  belongs_to :region
  has_many :cameras
  has_many :reports
  has_one :report, -> { order("id DESC") }

  after_create :create_cameras

  accepts_nested_attributes_for :report
  accepts_nested_attributes_for :cameras
  

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

  def fs_percentage
    begin
        (self.fs * 100)/ self.total
    rescue
        0
    end
  end 
  
  def percentage_css_class
    return 'text-red-400 ' if self.fs_percentage > 70
    return 'text-yellow-600 ' if self.fs_percentage > 40
    'text-green-400 '
  end
end
