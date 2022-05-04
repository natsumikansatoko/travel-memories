class AddUserIdToMemories < ActiveRecord::Migration[6.1]
  def change
    add_column :memories, :user_id, :integer
  end
end
