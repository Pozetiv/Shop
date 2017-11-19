require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  #def setup
  #  @user = users(:tester)
 #   @other_user = users(:tester2)
 # end

  #test "dont true user" do
  #  log_in_as(@other_user)
  #  ger edit_user_path(@user)
   # assert flash.empty?
   # assert_redirect_to root_url
  #end

  test "sign_in page" do
    get signin_path
    assert_response :success
  end


end
