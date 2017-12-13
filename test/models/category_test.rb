require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @category = Category.new(name: 'First')
  end

  test "should be valid" do
    assert @category.valid?
  end

  test "should be not valid" do
    @category.name= "  "
    assert_not @category.valid?
  end

  test "category should be unique" do
    duplicate_category = @category.dup
    @category.save
    assert_not duplicate_category.valid?
  end
end
