class AddMemoryIdToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_column :favorites, :memory_id, :integer
  end
end
