require 'rails_helper'

RSpec.describe Album, type: :model do

  it { should have_many(:images) }

  it { should belong_to(:creator) }

  it { should validate_presence_of(:title) }

  it { should validate_presence_of(:vanity_url) }
end
