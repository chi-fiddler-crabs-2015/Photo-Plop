class CreateAlbumsUsers < ActiveRecord::Migration
  def change
    create_table :albums_users do |t|
      t.belongs_to :album
      t.belongs_to :user
      t.boolean :access, default: false

      t.timestamps
    end
  end
end
