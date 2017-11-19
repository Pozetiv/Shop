require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  test "should get signin" do
    get signin_path
    assert_response :success
  end

end
