require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  setup do
    @admin_user = User.create(username: "johndoe", email: "johndoe@example.com",
                              password: "password", admin: true)
    sign_in_as(@admin_user)
  end

  # test "get new category form & creating the category" do
  #   get "/categories/new"
  #   assert_response :success

  #   assert_difference 'Category.count', 1 do
  #     # puts "categories_path: #{categories_path}"
  #     post categories_path, params: { category: { name: "Travel"} }
  #     assert_response :redirect
  #   end

  #   follow_redirect!
  #   assert_response :success
  #   assert_match "Travel", response.body
  # end

  # test "get new category & reject invalid category" do
  #   get "/categories/new"
  #   assert_response :success

  #   assert_no_difference 'Category.count' do
  #     # puts "categories_path: #{categories_path}"
  #     post categories_path, params: { category: { name: "" } }
  #   end
  #   assert_match "errors", response.body
  #   assert_select "div.alert"
  #   assert_select "h4.alert-heading"
  # end
end
