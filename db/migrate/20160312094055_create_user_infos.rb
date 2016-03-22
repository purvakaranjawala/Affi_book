class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.integer :user_id
      t.string :address
      t.integer :contact
      t.string :qualification
      t.date   :dob
      t.string :write_about_you
      t.string :gender
      t.timestamps null: false
    end
  end
end
