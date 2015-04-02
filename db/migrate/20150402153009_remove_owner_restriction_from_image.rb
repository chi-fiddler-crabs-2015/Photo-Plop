class RemoveOwnerRestrictionFromImage < ActiveRecord::Migration
  def change
    change_column :images, :owner_id, :integer, null: true
  end
end
