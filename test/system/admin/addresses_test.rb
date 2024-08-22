require "application_system_test_case"

class Admin::AddressesTest < ApplicationSystemTestCase
  setup do
    @admin_address = admin_addresses(:one)
  end

  test "visiting the index" do
    visit admin_addresses_url
    assert_selector "h1", text: "Addresses"
  end

  test "should create address" do
    visit admin_addresses_url
    click_on "New address"

    fill_in "Admin administrators", with: @admin_address.admin_administrators_id
    fill_in "Bairro", with: @admin_address.bairro
    fill_in "Cep", with: @admin_address.cep
    fill_in "Estado", with: @admin_address.estado
    fill_in "Numero", with: @admin_address.numero
    fill_in "Rua", with: @admin_address.rua
    click_on "Create Address"

    assert_text "Address was successfully created"
    click_on "Back"
  end

  test "should update Address" do
    visit admin_address_url(@admin_address)
    click_on "Edit this address", match: :first

    fill_in "Admin administrators", with: @admin_address.admin_administrators_id
    fill_in "Bairro", with: @admin_address.bairro
    fill_in "Cep", with: @admin_address.cep
    fill_in "Estado", with: @admin_address.estado
    fill_in "Numero", with: @admin_address.numero
    fill_in "Rua", with: @admin_address.rua
    click_on "Update Address"

    assert_text "Address was successfully updated"
    click_on "Back"
  end

  test "should destroy Address" do
    visit admin_address_url(@admin_address)
    click_on "Destroy this address", match: :first

    assert_text "Address was successfully destroyed"
  end
end
