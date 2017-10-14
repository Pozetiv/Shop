require 'test_helper'

class UserEditTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = user(:tester)
  end

  test "unsuccessful edit" do
    get edit_user_path(@user)
    assert_template 'user/edit'
    path user_path(@user), params: {user: {name: "",
                                          email: "fall",
                                          password: "1"}}
    assert_template 'user/edit'
  end
end
