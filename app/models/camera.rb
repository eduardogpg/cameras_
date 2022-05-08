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
class Camera < ApplicationRecord
  belongs_to :place

  scope :working, ->  { where('working > ? ', 0) }
  scope :fs, ->  { where('fs > ? ', 0) }

  enum kind: [:termica, :fija, :domo, :ptz, :lpr]

  def kind_format
    return 'Cam. Termica.' if self.kind == 'termica'
    return 'Cam. Fija.' if self.kind == 'fija'
    return 'Cam. Mini Domo.' if self.kind == 'domo'
    return 'Cam. PTZ.' if self.kind == 'ptz'
    return 'Cam. LPR.' if self.kind == 'lpr'
  end

end
