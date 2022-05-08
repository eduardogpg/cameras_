class CreateCameras < ActiveRecord::Migration[7.0]
  def change
    create_table :cameras do |t|
      t.integer :working
      t.integer :fs
      t.integer :kind, default:0
      t.references :place, null: false, foreign_key: true

      t.timestamps
    end
  end
end
