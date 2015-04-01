class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :token, null: false
      t.string :secret, null: false
      t.belongs_to :user, null: false
    end
    remove_column :users, :provider, :string
    remove_column :users, :uid, :string
    remove_column :users, :token, :string
    remove_column :users, :secret, :string
  end
end
