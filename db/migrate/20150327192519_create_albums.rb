class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.text :description
      t.string :vanity_url, unique: true, null: false
      t.belongs_to :creator, index: true
      t.string :password
      t.integer :permissions, null: false, default: 1

      t.timestamps null: false
    end
  end
end
