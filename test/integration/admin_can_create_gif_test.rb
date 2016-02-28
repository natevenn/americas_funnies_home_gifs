require 'test_helper'

class AdminCanCreateCategoriesTest < ActionDispatch::IntegrationTest
   test "admin sees created category" do
     admin = User.create(username: 'nate', password: 'password', role: 1)

     ApplicationController.any_instance.stubs(:current_user).returns(admin)

     visit admin_path

     click_on "New Gif"
     fill_in "Name", with: "Panda"
     click_on "Create Gif"

     assert_equal current_path, admin_categories_path
     assert page.has_content?("Panda")
   end

   test 'admin can not longer see deleted category' do
     admin = User.create(username: 'nate', password: 'password', role: 1)
     category = Category.create(name: 'Panda')

     ApplicationController.any_instance.stubs(:current_user).returns(admin)

     visit admin_categories_path

     click_on "Panda"
     click_on "Delete this category"

     assert_equal current_path, admin_categories_path
     refute page.has_content?("Panda")
   end

  test "user can't create gifs - sad path" do
    user = User.create(username: 'nate', password: 'password', role: 0)

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit admin_path

    assert page.has_content?("The page you were looking for doesn't exist")
  end

  test "users can't see category index" do
    category = Category.create(name: 'Panda')
    user = User.create(username: 'nate', password: 'password', role: 0)

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit admin_categories_path

    assert page.has_content?("The page you were looking for doesn't exist")
  end
end
