require "application_system_test_case"

class Sales::BankAccountsTest < ApplicationSystemTestCase
  setup do
    @sales_bank_account = sales_bank_accounts(:one)
  end

  test "visiting the index" do
    visit sales_bank_accounts_url
    assert_selector "h1", text: "Bank accounts"
  end

  test "should create bank account" do
    visit sales_bank_accounts_url
    click_on "New bank account"

    fill_in "Agencia", with: @sales_bank_account.agencia
    fill_in "Banco", with: @sales_bank_account.banco
    fill_in "Numero", with: @sales_bank_account.numero
    fill_in "Sales sellers", with: @sales_bank_account.sales_sellers_id
    click_on "Create Bank account"

    assert_text "Bank account was successfully created"
    click_on "Back"
  end

  test "should update Bank account" do
    visit sales_bank_account_url(@sales_bank_account)
    click_on "Edit this bank account", match: :first

    fill_in "Agencia", with: @sales_bank_account.agencia
    fill_in "Banco", with: @sales_bank_account.banco
    fill_in "Numero", with: @sales_bank_account.numero
    fill_in "Sales sellers", with: @sales_bank_account.sales_sellers_id
    click_on "Update Bank account"

    assert_text "Bank account was successfully updated"
    click_on "Back"
  end

  test "should destroy Bank account" do
    visit sales_bank_account_url(@sales_bank_account)
    click_on "Destroy this bank account", match: :first

    assert_text "Bank account was successfully destroyed"
  end
end
