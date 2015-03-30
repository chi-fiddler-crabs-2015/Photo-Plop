require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  let(:user) { create(:user) }
  let(:album) { create(:album, creator: user) }
  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  context 'GET #index' do
    before do
      get :index
    end
    it 'assigns @owned_albums albums the user created' do
      expect(assigns(:owned_albums)).to include album
    end

    it 'assigns @albums_added_images_to to include images user has added' do
      expect(assigns(:albums_added_images_to)).not_to include album
    end

    it 'assigns @fav_albums to users favorites' do
      expect(assigns(:fav_albums)).to eq user.favorites
    end
  end

  context 'GET #new' do
    it 'assigns @album to a new album' do
      get :new
      expect(assigns(:album)).to be_a_new Album
    end
  end

  context 'POST #create' do
  end

  context 'DELETE #destroy' do

    describe "successful delete request" do
      it 'destroys an album if the user is the owner' do
        album = create(:album, creator: user)
        expect {
          delete :destroy, { id: album.id }
        }.to change{Album.count}
      end

      it 'destroying an album to redirect home' do
        album = create(:album, creator: user)
        expect(
          delete :destroy, { id: album.id }
        ).to redirect_to albums_path
      end
    end

    describe "unsuccessful delete request" do
      it 'assigns @errors letting user know they dont have permission' do

      end
    end
  end
end
