require 'test_helper'

class UserCanRegisterTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "user sees user welcome page" do
  a visit "/login"

    click_on "Register"

    fill_in "username", with: "Nathan"
    fill_in "password", with: "password"
    click_on "Create account"

    user = User.last

    assert_equal "/user/#{user.id}", current_path
    assert page.has_content?("Welcome #{user.usernmae}")
  end
end
