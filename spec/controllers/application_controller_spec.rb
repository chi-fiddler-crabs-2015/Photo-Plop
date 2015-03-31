require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  context 'checks if a user is logged in' do
    it 'redirects to login path is user is not logged in' do
      expect(get :index).to redirect_to login_path
    end

    it 'redirects to album path if user is logged in' do
      allow_any_instance_of(ApplicationController).to receive(:logged_in?).and_return(true)
      expect(get :index).to redirect_to albums_path
    end
  end

  context '#logged_in?' do
    it 'returns a boolean' do
      app = ApplicationController.new
      allow(app).to receive(:current_user).and_return(true)
      expect(app.logged_in?).to eq true
    end
  end

end
