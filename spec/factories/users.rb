FactoryGirl.define do
  factory :user do
    username "charlie"
    email FFaker::Internet.email
    password "abcdefg12345"
  end
end
