class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, index: true, unique: true, null: false
      t.string :email, unique: true, null: false
      t.string :password_hash, null: false

      t.timestamps null: false
    end
  end
end
