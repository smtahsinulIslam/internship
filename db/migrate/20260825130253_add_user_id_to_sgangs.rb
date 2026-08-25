class AddUserIdToSgangs < ActiveRecord::Migration[8.1]
  def change
    add_column :sgangs, :user_id, :integer
    add_index :sgangs, :user_id
  end
end
