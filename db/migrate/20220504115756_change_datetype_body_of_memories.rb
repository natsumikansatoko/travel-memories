class ChangeDatetypeBodyOfMemories < ActiveRecord::Migration[6.1]
  def change
    change_column :memories, :body, :text
  end
end
