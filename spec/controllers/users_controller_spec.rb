require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET new user form" do

    it { should route(:get, '/users/new').to(action: :new) }
  end

  describe "POST new user" do
    it { should route(:post, '/users').to(action: :create) }

    it { should permit(:username, :email, :password).for(:create) }

    context "when valid parameters are passed" do

      it "creates a new user" do
        expect { post :create, { user: { username: "test", email: "test@test.com", password: "1234567" } }
        }.to change{User.count}.by(1)

      end
      it "starts a new session" do
        expect { post :create, { user: { username: "test", email: "test@test.com", password: "1234567" } }
        }.to change{session[:user_id]}
      end

      it "redirects user to their album index" do
        expect( post :create, { user: { username: "test", email: "test@test.com", password: "1234567" } }
          ).to redirect_to albums_path
      end
    end

    context "when invalid parameters are passed" do
      let(:user) {create(:user)}

      it "throws an error for missing username " do
        expect { post :create, { user: { email: "test@test.com", password: "1234567" }}
        }.to raise_error
      end

      it "throws an error for missing email " do
        post :create, { user: { username: "test", password: "1234567" }}
        expect(assigns(:errors)).to_not be_nil
      end
      it "throws an error for missing password " do
        post :create, { user: { email: "test@test.com", username: "test" }}
        expect(assigns(:errors)).to_not be_nil
      end

      it "throws an error for a username or email that have been taken " do
        expect { post :create, { user: user }
        }.to raise_error
      end
    end
    #invalid:
    #it should show an error if:
    # i try not to use an email, username, password
    # i try to use an email or username thats already been taken
  end
end
