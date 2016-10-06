require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def user_credentials
    { email: 'user@example.com', password: default_password }
  end

  test "should get new" do
    get new_sessions_url
    assert_response :success
  end

  test "it renders the form again with invalid credentials" do
    post sessions_url, params: { user: user_credentials.merge(email: 'wrong') }
    assert_select '.error.row', 'Email or password was incorrect.'
  end

  test "it saves the user ID in the session with valid credentials" do
    post sessions_url, params: { user: user_credentials }
    assert_redirected_to root_url
    assert_equal User.first.id, session[:user_id], "Didn't save the user id in the session"
  end

  test "it clears the session on delete" do
    post sessions_url, params: { user: user_credentials }
    delete sessions_url
    assert_redirected_to root_url
    assert_nil session[:user_id]
  end
end
