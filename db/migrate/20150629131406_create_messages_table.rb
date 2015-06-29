class CreateMessagesTable < ActiveRecord::Migration
 def change
  create_table :messages do |t|
    t.integer :sender_id, null: false
    t.string :text, null: false
    t.integer :group_id

    t.timestamps null: false
  end
 end
end
