class AddUsedToTags < ActiveRecord::Migration
  def change
    add_column :tags, :used, :integer, :default => 0
  end
end
