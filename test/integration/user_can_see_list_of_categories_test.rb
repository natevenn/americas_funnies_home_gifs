require 'test_helper'

class UserCanSeeListOfCategoriesTest < ActionDispatch::IntegrationTest
  test "user sees list of categories created by admins" do
    user = User.create(username: "brennan", password: "password", role: 0)
    category_1 = Category.create(name: "pandas")
    category_2 = Category.create(name: "lol_cats")

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit users_path

    assert page.has_content?("pandas")
    assert page.has_content?("lol_cats")
  end
end
