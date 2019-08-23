require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    test "full_name returns the capitalized first name and last name" do
       user = User.new(first_name: "don", last_name: "trump")
       assert_equal "Don Trump", user.full_name
    end

    test "full_name  works with either first name or last name empty " do
      user1 = User.new(last_name: "obama")
      assert_equal "Obama", user1.full_name
      user2 = User.new(first_name: "george")
      assert_equal "George", user2.full_name
    end
end
