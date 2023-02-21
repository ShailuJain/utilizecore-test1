require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "email should in valid format" do
    @user.email = "sddf"
    assert_not @user.valid?
    @user.email = nil
    assert_not @user.valid?
  end
end
