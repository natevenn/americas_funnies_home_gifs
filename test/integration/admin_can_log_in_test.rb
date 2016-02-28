require 'test_helper'

class AdminCanLogInTest < ActionDispatch::IntegrationTest
   test "admin can see admin welcome message after logging in" do
     admin = User.create(username: 'nate', password: 'password', role: 1)

     visit '/login'

     fill_in "Username", with: 'nate'
     fill_in "Password", with: 'password'
     click_on "login"

     assert_equal current_path, admin_path
     assert page.has_content?("Welcome, Admin")
   end
end
