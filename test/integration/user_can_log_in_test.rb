require 'test_helper'

class UserCanLogInTest < ActionDispatch::IntegrationTest
  test "user sees gifs on own show page" do
    user = User.create(username: "brennan", password: "password", role: 0)
    visit '/login'

    fill_in "Username", with: "brennan"
    fill_in "Password", with: "password"
    click_on "login"

    assert_equal current_path, user_path(user)
    assert page.has_content?("Your favorited gifs")
  end
end
