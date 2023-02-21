require "test_helper"

class AddressTest < ActiveSupport::TestCase
  setup do
    @address = addresses(:one)
  end

  test "address should be valid" do
    assert @address.valid?
  end

  test "mobile number should in valid format" do
    @address.mobile_number = nil
    assert @address.valid?

    @address.mobile_number = "wewd"
    assert_not @address.valid?

    @address.mobile_number = "9234392342"
    assert @address.valid?
  end
end
