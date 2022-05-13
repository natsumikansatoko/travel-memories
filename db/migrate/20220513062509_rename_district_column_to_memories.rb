class RenameDistrictColumnToMemories < ActiveRecord::Migration[6.1]
  def change
    rename_column :memories, :district, :district_id
    
  end
end
