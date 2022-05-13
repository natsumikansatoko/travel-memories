class CreateDistricts < ActiveRecord::Migration[6.1]
  def change
    create_table :districts do |t|
      t.integer :memory_id
      t.timestamps
    end
  end
end
