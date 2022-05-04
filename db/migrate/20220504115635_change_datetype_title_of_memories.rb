class ChangeDatetypeTitleOfMemories < ActiveRecord::Migration[6.1]
  def change
    change_column :memories, :title, :string
  end
end
