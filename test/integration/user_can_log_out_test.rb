require 'test_helper'

class UserCanLogOutTest < ActionDispatch::IntegrationTest
   test "user can not sees login page after logging out" do
     user = User.create(username: "nate", password: "password")

     ApplicationController.any_instance.stubs(:current_user).returns(user)

     visit user_path(user)

     click_on "Log Out"

     assert current_path, login_path
   end
end
