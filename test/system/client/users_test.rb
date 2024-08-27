require "application_system_test_case"

class Client::UsersTest < ApplicationSystemTestCase
  setup do
    @client_user = client_users(:one)
  end

  test "visiting the index" do
    visit client_users_url
    assert_selector "h1", text: "Users"
  end

  test "should create user" do
    visit client_users_url
    click_on "New user"

    fill_in "Cpf", with: @client_user.cpf
    fill_in "Email", with: @client_user.email
    fill_in "Nome", with: @client_user.nome
    fill_in "Password digest", with: @client_user.password_digest
    fill_in "Telefone", with: @client_user.telefone
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "should update User" do
    visit client_user_url(@client_user)
    click_on "Edit this user", match: :first

    fill_in "Cpf", with: @client_user.cpf
    fill_in "Email", with: @client_user.email
    fill_in "Nome", with: @client_user.nome
    fill_in "Password digest", with: @client_user.password_digest
    fill_in "Telefone", with: @client_user.telefone
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "should destroy User" do
    visit client_user_url(@client_user)
    click_on "Destroy this user", match: :first

    assert_text "User was successfully destroyed"
  end
end
