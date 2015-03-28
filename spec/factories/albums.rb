FactoryGirl.define do
  factory :album do
    title FFaker::Address.city
    password "abcdef"
    vanity_url "1234567890abcdefg".split('').shuffle.join
    association :creator, factory: :user
  end
end
