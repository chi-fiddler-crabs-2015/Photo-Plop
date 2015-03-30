require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
  let(:user) { create(:user) }
  let(:album) { create(:album, creator: user) }
  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  context 'GET #new' do
    it 'assigns @image to a new image' do
      get :new, {album_id: album.id}
      expect(assigns(:image)).to be_a_new Image
    end

    it 'belongs to an album' do
      get :new, {album_id: album.id}
      expect(assigns(:album)).to be_a Album
    end
  end


end
