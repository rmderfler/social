class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :user_id
      t.string :user_name
      t.string :user_email
      t.integer :friend_id

    end
  end
end
