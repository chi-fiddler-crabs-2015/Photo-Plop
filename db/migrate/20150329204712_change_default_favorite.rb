class ChangeDefaultFavorite < ActiveRecord::Migration
  def change
    change_column :favorites, :favorite, :boolean, default: false
  end
end
