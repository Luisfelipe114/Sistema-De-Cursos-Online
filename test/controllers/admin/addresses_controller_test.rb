require "test_helper"

class Admin::AddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_address = admin_addresses(:one)
  end

  test "should get index" do
    get admin_addresses_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_address_url
    assert_response :success
  end

  test "should create admin_address" do
    assert_difference("Admin::Address.count") do
      post admin_addresses_url, params: { admin_address: { admin_administrators_id: @admin_address.admin_administrators_id, bairro: @admin_address.bairro, cep: @admin_address.cep, estado: @admin_address.estado, numero: @admin_address.numero, rua: @admin_address.rua } }
    end

    assert_redirected_to admin_address_url(Admin::Address.last)
  end

  test "should show admin_address" do
    get admin_address_url(@admin_address)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_address_url(@admin_address)
    assert_response :success
  end

  test "should update admin_address" do
    patch admin_address_url(@admin_address), params: { admin_address: { admin_administrators_id: @admin_address.admin_administrators_id, bairro: @admin_address.bairro, cep: @admin_address.cep, estado: @admin_address.estado, numero: @admin_address.numero, rua: @admin_address.rua } }
    assert_redirected_to admin_address_url(@admin_address)
  end

  test "should destroy admin_address" do
    assert_difference("Admin::Address.count", -1) do
      delete admin_address_url(@admin_address)
    end

    assert_redirected_to admin_addresses_url
  end
end
