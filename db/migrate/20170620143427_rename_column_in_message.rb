class RenameColumnInMessage < ActiveRecord::Migration[5.1]
  def change
  	rename_column :messages, :users_id, :user_id
  	rename_column :messages, :chatrooms_id, :chatroom_id
  end
end
