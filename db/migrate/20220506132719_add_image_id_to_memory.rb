class AddImageIdToMemory < ActiveRecord::Migration[6.1]
  def change
    add_column :memories, :image_id, :string
  end
end
