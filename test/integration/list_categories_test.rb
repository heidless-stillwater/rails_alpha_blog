require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest

  def setup   
    @category1 = Category.create(name: "Sports 1")
    @category2 = Category.create(name: "Travel 2")
  end

  test "should show category listing" do

    get "/categories"
    assert_response :success

    assert_select "a[href=?]", category_path(@category1), text: @category1.name
    assert_select "a[href=?]", category_path(@category2), text: @category2.name

  end


end