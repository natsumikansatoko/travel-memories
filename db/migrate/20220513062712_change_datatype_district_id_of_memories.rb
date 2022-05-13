class ChangeDatatypeDistrictIdOfMemories < ActiveRecord::Migration[6.1]
  def change
    change_column :memories, :district_id, :integer
  end
end
