require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  test "that current_user returns the logged in user" do
    user = login_user
    assert_equal user, @controller.current_user
  end

  test "that current_user returns nil when not logged in" do
    get root_url
    assert_equal nil, @controller.current_user
  end
end
