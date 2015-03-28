class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :caption
      t.string :file_url, unique: true, null: false
      t.belongs_to :album, index: true, null: false
      t.belongs_to :owner, index: true, null: false

      t.timestamps null: false
    end
  end
end
