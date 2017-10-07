require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "test", email: "test@email.com", password: "test",
                      password_confirnation: "test")
  end

  test "shout be valid" do
    assert @user.valid?
  end

  test "test emails" do
    @user.email = "a@email.com"
    assert_not @user.valid?
  end
end
