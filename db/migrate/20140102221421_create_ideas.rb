class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.integer :upvotes, default: 0

      t.timestamps
    end
  end
end
