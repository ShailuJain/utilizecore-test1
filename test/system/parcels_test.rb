require "application_system_test_case"

class ParcelsTest < ApplicationSystemTestCase
  setup do
    sign_in_as(users(:admin), "test", ui: true)
    update_default_address(ui: true)
    @parcel = parcels(:one)
  end

  test "visiting the index" do
    visit parcels_url
    assert_selector "h1", text: "List Parcels"
  end

  test "destroying a Parcel" do
    visit parcels_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Parcel was successfully destroyed"
  end
end
