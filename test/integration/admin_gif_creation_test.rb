require 'test_helper'

class AdminGifCreationTest < ActionDispatch::IntegrationTest
   test "admin can see the gif that was created" do
     admin = User.create(username: 'nate', password: 'password', role: 1)

     ApplicationController.any_instance.stubs(:current_user).returns(admin)

     visit admin_path

     click_on "New Gif"
     fill_in "Name", with: "Panda"
     click_on "Create Gif"

     click_on "Panda"

     assert_equal current_path, admin_category_path(Category.last.id)
     assert page.has_content?("Panda")
     assert page.has_content?("gif count - 1")
   end

   test "admin sees only one panda category when creating two panda gifs" do
     category = Category.create(name: "Panda")

     admin = User.create(username: 'nate', password: 'password', role: 1)

     ApplicationController.any_instance.stubs(:current_user).returns(admin)

     visit admin_path

     click_on "New Gif"
     fill_in "Name", with: "Panda"
     click_on "Create Gif"
     assert_equal 1, Category.all.count
   end
end
