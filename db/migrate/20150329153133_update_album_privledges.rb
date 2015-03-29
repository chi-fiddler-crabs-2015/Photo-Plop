class UpdateAlbumPrivledges < ActiveRecord::Migration
  def change
    add_column :albums, :read_privilege, :integer, default: 1
    add_column :albums, :write_privilege, :integer, default: 1
    remove_column :albums, :permissions, :integer
  end
end
