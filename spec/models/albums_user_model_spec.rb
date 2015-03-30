require 'rails_helper'

RSpec.describe AlbumsUser, type: :model do

  it { should belong_to(:album) }

  it { should belong_to(:user) }

  it { should validate_presence_of(:read_privilege) }

  it { should validate_presence_of(:write_privilege) }

end
