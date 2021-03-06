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

    it { should validate_presence_of(:creator) }

    it { should validate_presence_of(:read_privilege) }

    it { should validate_presence_of(:write_privilege) }

    it { should validate_uniqueness_of(:vanity_url) }

    it { should validate_length_of(:title).is_at_most(75) }

    it { should validate_length_of(:password).is_at_most(20) }

  end

  describe "Database" do

    it { should have_db_index(:creator_id) }

  end

  describe "Owner?" do

  end

  describe "Read_Authenticate" do

  end

  describe "Write_Authenticate" do

  end
end
