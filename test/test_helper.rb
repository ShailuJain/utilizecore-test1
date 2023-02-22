ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def sign_in_as(user, password, ui: false)
    if !ui
      post login_path, params: { email: user.email, password: password }
    else
      visit login_url
      fill_in "Email", with: user.email
      fill_in "Password", with: password
      click_on "Sign In"
    end
  end

  def update_default_address(ui: false)
    address = addresses(:one)
    if !ui
      post addresses_url, params: { address: { address_line_one: address.address_line_one, address_line_two: address.address_line_two, city: address.city, country: address.country, mobile_number: address.mobile_number, pincode: address.pincode, state: address.state } }
    else
      fill_in "Address line one", with: address.address_line_one
      fill_in "Address line two", with: address.address_line_two
      fill_in "City", with: address.city
      fill_in "Country", with: address.country
      fill_in "Mobile number", with: address.mobile_number
      fill_in "Pincode", with: address.pincode
      fill_in "State", with: address.state
      click_on "Create Address"
    end
  end
end
