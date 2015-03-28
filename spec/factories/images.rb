FactoryGirl.define do
  factory :image do
    caption FFaker::Company.catch_phrase
    url "1234567890abcdefg".split('').shuffle.join
    association :owner, factory: :user
    association :album, factory: :album
  end
end
