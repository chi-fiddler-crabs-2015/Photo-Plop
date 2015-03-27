FactoryGirl.define do
  factory :user do
    email FFaker::Internet.email
    password "abcdefg12345"
    password_confirmation "abcdefg12345"
  end
end
