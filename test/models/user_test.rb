require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "the #full_name sends back the capitalized full name" do
    user = User.new(first_name: "john", last_name: "lennon")
    assert_equal "John Lennon", user.full_name
  end
end
