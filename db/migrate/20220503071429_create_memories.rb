class CreateMemories < ActiveRecord::Migration[6.1]
  def change
    create_table :memories do |t|
      t.string :address, null: false, default: ""
      t.float :latitude
      t.float :longitude
      t.string :district
      t.string :title, null: false, default: ""
      t.text :body
      t.float :rate, null: false, default: 0.0

      t.timestamps null: false
    end
  end
end
