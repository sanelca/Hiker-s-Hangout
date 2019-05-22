require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "Get root page" do
    get root_path
    assert_response :success
  end
end
