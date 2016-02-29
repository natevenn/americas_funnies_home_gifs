require 'test_helper'

class AdminCanDeleteingleGifTest < ActionDispatch::IntegrationTest
  test "admin doesn't see gif, and count goes down" do
    admin = User.create(username: "nate", password: "password", role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit new_admin_category_path

    fill_in "Name", with: "cheers"
    click_on "Create Gif"

    click_on "cheers"

    click_on 'delete gif 25'

    refute page.has_content?("delete gif 25")
    assert page.has_content?("gif count - 24")
  end
end
