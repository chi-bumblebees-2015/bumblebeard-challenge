class CreateMessagesUsersTable < ActiveRecord::Migration
 def change
  create_table :messages_users do |t|
    t.integer :message_id, null: false
    t.integer :user_id, null: false

    t.timestamps null: false
  end
 end
end
