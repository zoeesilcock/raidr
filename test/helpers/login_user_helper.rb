module LoginUserHelper
  def login_user
    post sessions_url, params: { user: { email: 'user@example.com', password: 'potatoes' } }
  end
end
