class RenameInstitutionIdToRegionId < ActiveRecord::Migration[7.0]
  def change
    rename_column :places, :institution_id, :region_id
  end
end
