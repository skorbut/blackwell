FactoryGirl.define do
  sequence :email do |n|
    "user_#{n}@example.com"
  end

  factory :user do
    email
    password 'password'
  end
end
