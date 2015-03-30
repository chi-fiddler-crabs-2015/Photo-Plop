FactoryGirl.define do
  factory :user do
    initialize_with { User.new({
    username: FFaker::Internet.user_name,
    email: FFaker::Internet.email,
    password: "abcdefg12345"}) }
  end
end
