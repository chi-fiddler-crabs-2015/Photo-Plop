class CreateCollaboratorsAlbums < ActiveRecord::Migration
  def change
    create_table :collaborators_albums do |t|
      t.belongs_to :album, index: true, null: false
      t.belongs_to :collaborator, index: true, null: false
      t.timestamps null: false
    end
  end
end
