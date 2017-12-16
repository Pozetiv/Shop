FactoryGirl.define do
  factory :user do
    name     "Testrs"
    email    "Testrs@test.com"
    password "test1234"

  end
  factory :admin do
    name "adminrss"
    email "adminrss@admin.com"
    password "admin1234"
    admin true
  end
end