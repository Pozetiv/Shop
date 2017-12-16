
FactoryGirl.define do
  factory :user do
    name     "Testrs"
    email    "Testrs@test.com"
    password "test1234"
    password_confirmation "test1234"
  end
end