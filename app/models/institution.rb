# == Schema Information
#
# Table name: institutions
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Institution < ApplicationRecord
    has_many :places

    validates :name, presence:true

    def cameras
        self.places.reduce(0) { |sum, place| sum + place.total }
    end

end
