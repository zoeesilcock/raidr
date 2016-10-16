require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def user_attributes
    {
      email: 'test@test.com',
      gamertag: 'bubbles',
      password: 'a',
      confirm_password: 'a'
    }
  end

  test "that it gets new" do
    get new_users_url
    assert_response :success
  end

  test "that it gets show" do
    login_user
    get profile_url
    assert_response :success
  end

  test "that it saves the user if valid" do
    post users_url, params: { user: user_attributes }
    assert_redirected_to root_url
  end

  test "that it renders the form if the user is invalid" do
    post users_url, params: { user: user_attributes.merge(email: nil) }
    assert_template :new
  end

  test "that it logs the user in" do
    post users_url, params: { user: user_attributes }
    assert_not_nil session[:user_id]
  end

  test "that it gets edit" do
    login_user
    get profile_edit_url
    assert_response :success
  end

  test "that it updates the user" do
    user = login_user
    new_gamer_tag = 'ricky'

    put users_path, params: { user: { gamertag: new_gamer_tag } }

    user.reload
    assert_equal new_gamer_tag, user.gamertag
    assert_redirected_to profile_url
  end

  test "that it renders the user form if the user is invalid" do
    login_user
    put users_path, params: { user: { gamertag: nil } }
    assert_template :edit
  end
end
