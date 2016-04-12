class CreateLikeships < ActiveRecord::Migration
  def change
    create_table :likeships do |t|
      t.integer :user_id
      t.integer :post_id
      t.boolean  :flag
      t.timestamps null: false
    end
        add_index :likeships, :user_id
        add_index :likeships, :post_id
        add_index :likeships, [:user_id, :post_id], unique: true
  end
end
