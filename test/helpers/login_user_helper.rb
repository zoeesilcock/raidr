module LoginUserHelper
  def login_user(email = nil)
    email = User.first.email if email.nil?
    post sessions_url, params: { user: { email: email, password: 'potatoes' } }

    return User.find_by_email(email)
  end
end
