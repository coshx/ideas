class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :admin_id
      t.integer :idea_id

      t.timestamps
    end
  end
end
