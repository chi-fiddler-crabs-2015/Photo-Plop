class CreateAlbumsUsers < ActiveRecord::Migration
  def change
    create_table :albums_users do |t|
      t.belongs_to :album
      t.belongs_to :user
      t.integer :read_privilege, default: 1
      t.integer :write_privilege, default: 1

      t.timestamps
    end
  end
end
