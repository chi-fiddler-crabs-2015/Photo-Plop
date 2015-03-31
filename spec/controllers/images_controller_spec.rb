require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
  let(:user) { create(:user) }
  let(:album) { create(:album, creator: user, vanity_url: 'asldkfj234') }
  let(:image) { create(:image, owner: user, album: album) }
  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  context 'GET #new' do
    it 'assigns @image to a new image' do
      get :new, { album_id: album.id }
      expect(assigns(:image)).to be_a_new Image
    end

    it 'belongs to an album' do
      get :new, { album_id: album.id }
      expect(assigns(:album)).to be_a Album
    end

    it 'renders new partial if write privilege 1' do
      get :new, { album_id: album.id }
      expect(response).to render_template("images/_new")
    end

    it 'asks for a password if write privilege is > 1' do
      album = create(:album, write_privilege: 2)
      get :new, { album_id: album.id }
      expect(response).to render_template("images/_prompt_for_password")
    end
  end

  context 'POST #auth' do
    let(:album) { create(:album, creator: user, vanity_url: 'asldkfj234', write_privilege: 2, password: 'dbc') }
    it 'renders new partial if proper password is attached' do
      post :auth, {album_id: album.id, album: {password: 'dbc'}}
      expect(response).to render_template("images/_new")
    end

    it 'redirects back if wrong password is attached' do
      @request.env['HTTP_REFERER'] = '/albums'
      post :auth, {album_id: album.id, album: {password: 'dbc123'}}
      expect(response).to redirect_to albums_path
    end
  end

  context 'GET #show' do
    it 'assigns @image to current image' do
      get :show, { album_id: album.id, id: image.id}
      expect(assigns(:image)).to be_a Image
    end
  end

  context 'DELETE #destroy' do
    it 'destroys an image' do
      image = create(:image, owner: user)
      expect {
        delete :destroy, { album_id: album.id, id: image.id }
      }.to change{Image.count}
    end
  end
end
