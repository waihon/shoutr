class CreateFollowingRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :following_relationships do |t|
      t.integer :follower_id
      t.integer :followed_user_id

      t.timestamps
    end
    add_index :following_relationships, :follower_id
    add_index :following_relationships, :followed_user_id
    add_index :following_relationships, [:follower_id, :followed_user_id], unique: true,
      name: 'index_on_follower_id_and_followed_user_id'
    add_foreign_key :following_relationships, :users, column: :follower_id
    add_foreign_key :following_relationships, :users, column: :followed_user_id
  end
end
