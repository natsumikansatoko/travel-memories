class AddMemoryIdToLikes < ActiveRecord::Migration[6.1]
  def change
    add_column :likes, :memory_id, :integer
  end
end
