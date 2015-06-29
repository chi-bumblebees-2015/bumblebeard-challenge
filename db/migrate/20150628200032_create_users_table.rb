class CreateUsersTable < ActiveRecord::Migration
 def change
  create_table :users do |t|
    t.string :username, null: false, limit: 25
    t.string :password, null: false, limit: 30
    t.integer :public_key

    t.timestamps null: false
  end
 end
end
