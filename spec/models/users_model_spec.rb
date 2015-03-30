require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#Associations" do

    it { should have_many(:albums) }

    it { should have_many(:collaborators_albums) }

    it { should have_many(:images) }
  end

  describe "#Validations" do
    subject { FactoryGirl.build(:user) }

    it { should validate_presence_of(:email) }

    it { should validate_presence_of(:password_hash) }

    it { should validate_uniqueness_of(:email) }

    it { should validate_uniqueness_of(:username) }
  end

  describe "#Database" do

    it { should have_db_index(:username) }

  end

  describe "#Authenticate" do
    let(:user) { create(:user, password: 'abc') }

    it 'calling password returns a password hash' do
      expect(user.password).to match(/\$2a/)
    end

    it 'returns a user object on correct password' do
      expect(User.authenticate({username: user.username, password: 'abc'})).to be_a User
    end

    it 'returns nil on incorrect password' do
      expect(User.authenticate({username: user.username, password: 'abcd'})).to be_nil
    end
  end
end
