require 'test_helper'

class AdminCanCreateANewGifInDatabaseTest < ActionDispatch::IntegrationTest
   test "admin can see admin dashboard with welcome message" do
     admin = User.create(username: "nate", password: "password", role: 1)

     ApplicationController.any_instance.stubs(:current_user).returns(admin)

     visit admins_path

     assert page.has_content?("Welcome, Admin")
   end
end
