require "application_system_test_case"

class Sales::SellersTest < ApplicationSystemTestCase
  setup do
    @sales_seller = sales_sellers(:one)
  end

  test "visiting the index" do
    visit sales_sellers_url
    assert_selector "h1", text: "Sellers"
  end

  test "should create seller" do
    visit sales_sellers_url
    click_on "New seller"

    fill_in "Cpf", with: @sales_seller.cpf
    fill_in "Email", with: @sales_seller.email
    fill_in "Nome", with: @sales_seller.nome
    fill_in "Password digest", with: @sales_seller.password_digest
    fill_in "Telefone", with: @sales_seller.telefone
    click_on "Create Seller"

    assert_text "Seller was successfully created"
    click_on "Back"
  end

  test "should update Seller" do
    visit sales_seller_url(@sales_seller)
    click_on "Edit this seller", match: :first

    fill_in "Cpf", with: @sales_seller.cpf
    fill_in "Email", with: @sales_seller.email
    fill_in "Nome", with: @sales_seller.nome
    fill_in "Password digest", with: @sales_seller.password_digest
    fill_in "Telefone", with: @sales_seller.telefone
    click_on "Update Seller"

    assert_text "Seller was successfully updated"
    click_on "Back"
  end

  test "should destroy Seller" do
    visit sales_seller_url(@sales_seller)
    click_on "Destroy this seller", match: :first

    assert_text "Seller was successfully destroyed"
  end
end
