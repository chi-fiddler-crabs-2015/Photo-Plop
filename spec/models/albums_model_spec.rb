require 'rails_helper'

RSpec.describe Album, type: :model do
  describe "Associations" do

    it { should belong_to(:creator) }

    it { should have_many(:images).dependent(:destroy) }

    it { should have_many(:collaborators_albums).dependent(:destroy) }

    it { should have_many(:collaborators).through(:collaborators_albums) }
  end

  describe "Validations" do
    subject { FactoryGirl.build(:album) }

    it { should validate_presence_of(:title) }

    it { should validate_presence_of(:vanity_url) }

    it { should validate_presence_of(:creator) }

    it { should validate_presence_of(:permissions) }

    it { should validate_uniqueness_of(:vanity_url) }

    it { should validate_length_of(:title).is_at_most(75) }

    it { should validate_length_of(:password).is_at_least(4) }

    it { should validate_length_of(:password).is_at_most(20) }

  end
end
