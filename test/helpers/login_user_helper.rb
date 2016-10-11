module LoginUserHelper
  def login_user
    user = User.first
    post sessions_url, params: { user: { email: user.email, password: 'potatoes' } }

    return user
  end
end
