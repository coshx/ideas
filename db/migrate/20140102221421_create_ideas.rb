class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.integer :admin_id
      t.string :title
      t.text :description
      t.integer :upvotes

      t.timestamps
    end
  end
end
