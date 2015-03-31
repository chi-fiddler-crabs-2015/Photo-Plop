class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string :provider
      t.string :uid
      t.string :token
      t.string :secret
      t.belongs_to :user
    end
    remove_column :users, :provider, :string
    remove_column :users, :uid, :string
    remove_column :users, :token, :string
    remove_column :users, :secret, :string
  end
end
