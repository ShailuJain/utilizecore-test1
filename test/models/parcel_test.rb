require "test_helper"

class ParcelTest < ActiveSupport::TestCase
  setup do
    @parcel = Parcel.new(weight: 100, cost: 200, sender_id: users(:one).id,
                         receiver_id: users(:two).id, status: "Sent", payment_mode: "COD", service_type_id: service_types(:one).id)
  end

  test "parcel should be valid" do
    assert @parcel.valid?
  end

  test "weight should be greater than 0 number" do
    @parcel.weight = -100
    assert_not @parcel.valid?
    @parcel.weight = 0
    assert_not @parcel.valid?
    @parcel.weight = nil
    assert_not @parcel.valid?
    @parcel.weight = "adddw"
    assert_not @parcel.valid?
  end

  test "cost should be greater than 0 number" do
    @parcel.cost = -100
    assert_not @parcel.valid?
    @parcel.cost = 0
    assert_not @parcel.valid?
    @parcel.cost = nil
    assert_not @parcel.valid?
    @parcel.cost = "adddw"
    assert_not @parcel.valid?
  end

  test "sender & receiver should not be same" do
    @parcel.sender_id = users(:one).id
    @parcel.receiver_id = users(:one).id
    assert_not @parcel.valid?
  end
end
