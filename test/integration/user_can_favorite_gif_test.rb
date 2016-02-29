require 'test_helper'

class UserCanFavoriteGifTest < ActionDispatch::IntegrationTest
   test "user can see all favorite gifs in thier user gifs show page" do
     user = User.create(username: 'nate', password: 'password', role: 0)
     category = Category.create(name: 'panda')
     category.gifs.create(name: 'panda', image_path: "http://giphy.com/gifs/panda-slide-ieaUdBJJC19uw")

     ApplicationController.any_instance.stubs(:current_user).returns(user)

     visit category_path(category)

     click_on "Like gif 1"

     assert_equal current_path, category_path(category)

     click_on "Your gifs"

     assert_equal current_path, user_path(user)

     assert page.has_content?("Unlike gif 1")
   end

   test "user no longer sees the unliked gif" do
     user = User.create(username: 'nate', password: 'password', role: 0)
     category = Category.create(name: 'madonna')
     category.gifs.create(name: 'madonna', image_path: "http://giphy.com/gifs/panda-slide-ieaUdBJJC19uw")

     ApplicationController.any_instance.stubs(:current_user).returns(user)

     visit category_path(category)

     click_on "Like gif 1"

     assert_equal current_path, category_path(category)

     click_on "Your gifs"
     click_on "Unlike gif 1"

    refute page.has_content?("Unlike gif 1")
   end
end
