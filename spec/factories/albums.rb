FactoryGirl.define do
  factory :album do
    title FFaker::Address.city
    association :creator, factory: :user
  end
end
