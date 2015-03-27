require 'rails_helper'

RSpec.describe CollaboratorsAlbum, type: :model do

  it { should belong_to(:album) }

  it { should belong_to(:collaborator) }

  it { should have_db_index(:album_id) }

  it { should have_db_index(:collaborator_id) }

end
