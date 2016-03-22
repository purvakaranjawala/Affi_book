class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :address
      t.integer :contact
      t.string :qualification
      t.date :dob
      t.string :gender
      t.timestamps null: false
    end
  end
end
