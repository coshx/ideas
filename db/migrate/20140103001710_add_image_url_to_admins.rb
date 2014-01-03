class AddImageUrlToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :image_url, :string
  end
end
