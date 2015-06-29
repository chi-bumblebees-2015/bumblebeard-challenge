class CreateContactIdsTable < ActiveRecord::Migration
 def change
  create_table :contact_ids do |t|
    t.integer :user_id, null: false
    t.integer :contact_id, null: false

    t.timestamps null: false
  end
 end
end
