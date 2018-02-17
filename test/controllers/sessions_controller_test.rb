require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  test "should get signin" do
    get new_user_session_path
    assert_response :success
  end

end
