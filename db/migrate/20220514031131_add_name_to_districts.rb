class AddNameToDistricts < ActiveRecord::Migration[6.1]
  def change
    add_column :districts, :name, :string
  end
end
