require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should get products_index" do
    get "/"
    assert_response :success
    assert_select "title", "Main page"
  end

  test "should get products_show" do
    get "/products/"
    assert_response :success
  end
end
