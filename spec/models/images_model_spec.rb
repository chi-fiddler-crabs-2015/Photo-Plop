require 'rails_helper'

RSpec.describe Image, type: :model do
  describe "Associations" do

    it { should belong_to(:owner) }

    it { should belong_to(:album) }

  end

  describe "Validations" do

    subject { FactoryGirl.build(:image, owner: User.create(id: 293847, email: "fake@fakerst.com", username: "alskdfjlkj")) }

    it { should validate_presence_of(:url) }

  end

  describe "Database" do

    it { should have_db_index(:album_id) }

    it { should have_db_index(:owner_id) }

  end


end
