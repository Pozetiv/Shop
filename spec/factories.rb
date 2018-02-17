FactoryGirl.define do
  factory :user do
    username     "Testrs"
    email    "Testrs@test.com"
    password "test1234"
    admin true
  end

 factory :tester do
   username "tester"
   email "testr@test.com"
   password "test1234"
   admin false
 end



end