require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Associations" do

    it { should have_many(:albums) }

    it { should have_many(:collaborators_albums) }

    it { should have_many(:images) }
  end

  describe "Validations" do
    subject { FactoryGirl.build(:user) }

    it { should validate_presence_of(:email) }

    it { should validate_presence_of(:password_hash) }

    it { should validate_uniqueness_of(:email) }

    it { should validate_uniqueness_of(:username) }
  end
end
