require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
 def setup
   @user = User.new(name: "tester", email: "tester@test.com")
 end

 test "name should be present" do
   @user.name = "     "
   assert_not @user.valid?
 end

 test "email should be present" do
   @user.email = "     "
   assert_not @user.valid?
 end
 test "email should not be too long" do
   @user.email = "a" * 244 + "@example.com"
   assert_not @user.valid?
 end


 test "password should be present (nonblank)" do
   @user.password = @user.password_confirmation = " " * 10
   assert_not @user.valid?
 end

 test "password should have a minimum length" do
   @user.password = @user.password_confirmation = "a" * 3
   assert_not @user.valid?
 end

  test "should be unique qmeil" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end


end
