class CreateGroupsTable < ActiveRecord::Migration
 def change
  create_table :groups do |t|
    t.string :name, null: false, limit: 50

    t.timestamps null: false
  end
 end
end
