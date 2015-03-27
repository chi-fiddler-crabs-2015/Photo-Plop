require 'rails_helper'

RSpec.describe CollaboratorsAlbum, type: :model do

  it { should belong_to(:collaborator) }

  it { should belong_to(:album) }

end
