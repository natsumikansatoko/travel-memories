class CreateMemoryImages < ActiveRecord::Migration[6.1]
  def change
    create_table :memory_images do |t|
      t.integer "memory_id", null: false
      t.string "image_id"
      t.timestamps
    end
  end
end
