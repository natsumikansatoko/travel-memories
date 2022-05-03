class CreateMemories < ActiveRecord::Migration[6.1]
  def change
    create_table :memories do |t|
      t.string :address, null: false, default: ""
      t.float :latitude
      t.float :longitude
      t.string :district, null: false, default: ""
      t.integer :title, null: false, default: ""
      t.integer :body, null: false, default: ""
      t.float :rate, null: false, default: "0"
      
      t.timestamps null: false
    end
  end
end
