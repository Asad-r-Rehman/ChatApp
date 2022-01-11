class CreateChatroomUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :chatroom_users do |t|
      t.belongs_to :user
      t.belongs_to :chatroom
      t.boolean :admin_role, :default => false
      t.timestamps
    end
  end
end
