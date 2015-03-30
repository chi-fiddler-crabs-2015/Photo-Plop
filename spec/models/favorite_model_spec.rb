require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:fav) { create(:favorite) }

  it { should belong_to(:album) }

  it { should belong_to(:user) }

  it 'changes status when change_status is called' do
    expect{fav.change_status}.to change{fav.favorite}
  end

end
