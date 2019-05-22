require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  test "login with invalid information" do
    post root_path, params: { session: { email: "", password: "" } }
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end
