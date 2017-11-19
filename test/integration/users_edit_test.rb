require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:test)
  end

  test "successful edit" do
    get edit_user_path(@user)
    patch user_path(@user), params: { user: { name:  "",
                                              email: "testvalid@test.com",
                                              password:              "foo"}}

    follow_redirect!
    get user_path(@user)
  end
end