class CollaboratorsAlbum < ActiveRecord::Base
  belongs_to :album
  belongs_to :collaborator, class_name: 'User'

end
