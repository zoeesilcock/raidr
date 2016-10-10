require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "that it gets index" do
    get home_index_url
    assert_response :success
  end

  test "that it redirects to the current group" do
    login_user

    user = User.first

    get home_index_url
    assert_redirected_to user.current_group
  end
end
