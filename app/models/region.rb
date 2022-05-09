# == Schema Information
#
# Table name: regions
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Region < ApplicationRecord
  has_many :places

  validates :name, presence:true

  def total
    self.places.reduce(0) { |sum, place| sum + place.total }
  end

  def fs 
    self.places.reduce(0) { |sum, place| sum + place.fs }
  end

  def working
    self.places.reduce(0) { |sum, place| sum + place.working }
  end

  def fs_percentage
    begin
        (self.fs * 100)/ self.total
    rescue
        0
    end
  end

  def percentage_css_class
    return 'text-red-600 ' if self.fs_percentage > 70
    return 'text-yellow-600 ' if self.fs_percentage > 40
    'text-green-500'
  end

end
