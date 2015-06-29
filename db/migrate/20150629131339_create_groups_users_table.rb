class CreateGroupsUsersTable < ActiveRecord::Migration
 def change
  create_table :groups_users do |t|
    t.integer :user_id, null: false
    t.integer :group_id, null: false

    t.timestamps null: false
  end
 end
end
