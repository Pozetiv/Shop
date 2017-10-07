require 'test_helper'

class MycontrollerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mycontroller_index_url
    assert_response :success
  end

end
