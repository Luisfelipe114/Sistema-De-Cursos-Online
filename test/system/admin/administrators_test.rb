require "application_system_test_case"

class Admin::AdministratorsTest < ApplicationSystemTestCase
  setup do
    @admin_administrator = admin_administrators(:one)
  end

  test "visiting the index" do
    visit admin_administrators_url
    assert_selector "h1", text: "Administrators"
  end

  test "should create administrator" do
    visit admin_administrators_url
    click_on "New administrator"

    fill_in "Cpf", with: @admin_administrator.cpf
    fill_in "Email", with: @admin_administrator.email
    fill_in "Nome", with: @admin_administrator.nome
    fill_in "Senha", with: @admin_administrator.senha
    fill_in "Telefone", with: @admin_administrator.telefone
    click_on "Create Administrator"

    assert_text "Administrator was successfully created"
    click_on "Back"
  end

  test "should update Administrator" do
    visit admin_administrator_url(@admin_administrator)
    click_on "Edit this administrator", match: :first

    fill_in "Cpf", with: @admin_administrator.cpf
    fill_in "Email", with: @admin_administrator.email
    fill_in "Nome", with: @admin_administrator.nome
    fill_in "Senha", with: @admin_administrator.senha
    fill_in "Telefone", with: @admin_administrator.telefone
    click_on "Update Administrator"

    assert_text "Administrator was successfully updated"
    click_on "Back"
  end

  test "should destroy Administrator" do
    visit admin_administrator_url(@admin_administrator)
    click_on "Destroy this administrator", match: :first

    assert_text "Administrator was successfully destroyed"
  end
end
