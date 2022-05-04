class AddGenreIdToMemories < ActiveRecord::Migration[6.1]
  def change
    add_column :memories, :genre_id, :integer
  end
end
