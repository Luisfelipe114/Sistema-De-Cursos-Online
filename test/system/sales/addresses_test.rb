require "application_system_test_case"

class Sales::AddressesTest < ApplicationSystemTestCase
  setup do
    @sales_address = sales_addresses(:one)
  end

  test "visiting the index" do
    visit sales_addresses_url
    assert_selector "h1", text: "Addresses"
  end

  test "should create address" do
    visit sales_addresses_url
    click_on "New address"

    fill_in "Bairro", with: @sales_address.bairro
    fill_in "Cep", with: @sales_address.cep
    fill_in "Estado", with: @sales_address.estado
    fill_in "Numero", with: @sales_address.numero
    fill_in "Rua", with: @sales_address.rua
    fill_in "Sales sellers", with: @sales_address.sales_sellers_id
    click_on "Create Address"

    assert_text "Address was successfully created"
    click_on "Back"
  end

  test "should update Address" do
    visit sales_address_url(@sales_address)
    click_on "Edit this address", match: :first

    fill_in "Bairro", with: @sales_address.bairro
    fill_in "Cep", with: @sales_address.cep
    fill_in "Estado", with: @sales_address.estado
    fill_in "Numero", with: @sales_address.numero
    fill_in "Rua", with: @sales_address.rua
    fill_in "Sales sellers", with: @sales_address.sales_sellers_id
    click_on "Update Address"

    assert_text "Address was successfully updated"
    click_on "Back"
  end

  test "should destroy Address" do
    visit sales_address_url(@sales_address)
    click_on "Destroy this address", match: :first

    assert_text "Address was successfully destroyed"
  end
end
