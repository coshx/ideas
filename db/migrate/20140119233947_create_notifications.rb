class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :objectable_id
      t.string :objectable_type
      t.integer :user_id

      t.timestamps
    end
  end
end
