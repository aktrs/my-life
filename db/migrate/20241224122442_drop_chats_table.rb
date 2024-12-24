class DropChatsTable < ActiveRecord::Migration[7.2]
  def change
    drop_table :chats, if_exists: true
  end
end
