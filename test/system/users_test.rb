require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "creating a User" do
    visit sign_up_url

    fill_in "Name", with: @user.name
    fill_in "Email", with: SecureRandom.hex(5) + "@gmail.com"
    fill_in "Password", with: "password"
    click_on "Sign Up"

    assert_text "User was successfully created"
  end
end
