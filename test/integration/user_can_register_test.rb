require 'test_helper'

class UserCanRegisterTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "user sees user welcome page" do
   visit "/register"

   fill_in "Username", with: "Nathan"
   fill_in "Password", with: "password"
   click_on "Create account"

   user = User.last

   assert_equal user_path(user), current_path
   assert page.has_content?("Welcome #{user.username}")
  end
end
