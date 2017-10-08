require 'test_helper'

class MycontrolControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mycontrol_index_url
    assert_response :success
  end

end
