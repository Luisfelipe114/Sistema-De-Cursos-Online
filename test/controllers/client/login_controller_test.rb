require "test_helper"

class Client::LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get client_login_index_url
    assert_response :success
  end
end
