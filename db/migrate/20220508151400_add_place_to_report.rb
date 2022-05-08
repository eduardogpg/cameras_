class AddPlaceToReport < ActiveRecord::Migration[7.0]
  def change
    add_reference :reports, :place, null: false, foreign_key: true
  end
end
