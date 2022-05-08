class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.string :name
      t.references :institution, null: false, foreign_key: true

      t.timestamps
    end
  end
end
