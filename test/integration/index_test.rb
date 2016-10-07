require 'test_helper'

class IndexTest < ActionDispatch::IntegrationTest
  test "that it shows the signup form when not logged in" do
    get root_url
    assert_select 'form', 1, "Login form not shown"
  end

  test "that it shows the welcome text when the user doesn't have a group" do
    login_user

    get root_url
    assert_select 'form', false, "Login form shown"
  end
end
