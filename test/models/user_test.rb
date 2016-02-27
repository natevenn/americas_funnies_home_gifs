require 'test_helper'

class UserTest < ActiveSupport::TestCase
   test "users can be either default or admin" do
     user = User.create(username: 'Brennen', password: 'password', role: 0)
     admin = User.create(username: 'nate', password: 'password', role: 1)

     assert user.default?
     refute user.admin?
     refute admin.default?
     assert admin.admin?
   end
end
