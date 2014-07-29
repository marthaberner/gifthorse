class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :user_id
      t.index :user_id
      t.integer :friend_id
      t.boolean :confirmed, default: false
      t.boolean :pending, default: false
      t.timestamp
    end
  end
end
