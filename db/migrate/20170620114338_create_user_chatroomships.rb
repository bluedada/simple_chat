class CreateUserChatroomships < ActiveRecord::Migration[5.1]
  def change
    create_table :user_chatroomships do |t|
      t.string :user_id
      t.string :integer
      t.integer :chatroom_id

      t.timestamps
    end
  end
end
