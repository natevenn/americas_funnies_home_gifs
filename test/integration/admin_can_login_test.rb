require 'test_helper'

class UserCanLoginAsAdmin < ActionDispatch::IntegrationTest
   test "admin can see admin dashboard with welcome message" do
     admin = User.create(username: "nate", password: "password", role: 1)

     ApplicationController.any_instance.stubs(:current_user).returns(admin)

     visit admin_path

     assert page.has_content?("Welcome, Admin")
   end

   test "user can not vist this page" do
     user = User.create(username: "nate", password: "password", role: 0)

     ApplicationController.any_instance.stubs(:current_user).returns(user)

     visit admin_path

     assert page.has_content?("The page you were looking for doesn't exist")
   end
end
