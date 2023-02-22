require "test_helper"

class ParcelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in_as(users(:admin), "test")
    update_default_address
    @parcel = parcels(:one)
  end

  test "should get index" do
    get parcels_url
    assert_response :success
  end

  test "should get new" do
    get new_parcel_url
    assert_response :success
  end

  test "should create parcel" do
    assert_difference('Parcel.count') do
      post parcels_url, params: { parcel: { receiver_id: @parcel.receiver_id, sender_id: @parcel.sender_id, service_type_id: @parcel.service_type_id,
                                            status: @parcel.status, weight: @parcel.weight, cost: @parcel.cost, payment_mode: @parcel.payment_mode } }
    end

    assert_redirected_to parcel_url(Parcel.last)
  end

  test "should show parcel" do
    get parcel_url(@parcel)
    assert_response :success
  end

  test "should get edit" do
    get edit_parcel_url(@parcel)
    assert_response :success
  end

  test "should update parcel" do
    patch parcel_url(@parcel), params: { parcel: { receiver_id: @parcel.receiver_id, sender_id: @parcel.sender_id, service_type_id: @parcel.service_type_id,
                                                   status: @parcel.status, weight: @parcel.weight, cost: @parcel.cost } }
    assert_redirected_to parcel_url(@parcel)
  end

  test "should have errors on update parcel if invalid params" do
    patch parcel_url(@parcel), params: { parcel: { receiver_id: @parcel.receiver_id, sender_id: @parcel.sender_id, service_type_id: @parcel.service_type_id,
                                                   status: @parcel.status, weight: @parcel.weight, cost: @parcel.cost } }
    assert_redirected_to parcel_url(@parcel)
  end

  test "should destroy parcel" do
    assert_difference('Parcel.count', -1) do
      delete parcel_url(@parcel)
    end

    assert_redirected_to parcels_url
  end
end
