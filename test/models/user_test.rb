require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def user_attributes
    {
      email: 'test@best.bar',
      password: 'password123',
      password_confirmation: 'password123',
      gamertag: 'carrot_king'
    }
  end

  test 'it requires an email' do
    user = User.new user_attributes.merge(email: nil)
    assert_not user.save, "Saved without an e-mail"
  end

  test 'the email has to be unique' do
    user = User.new user_attributes.merge(email: 'user@example.com')
    assert_not user.save, "Saved with en existing e-mail"
  end

  test 'it requires a password' do
    user = User.new user_attributes.merge(password: nil)
    assert_not user.save, "Saved without a password"
  end

  test 'the passwords must match' do
    user = User.new user_attributes.merge(password_confirmation: 'poo')
    assert_not user.save, "Saved with non matching passwords"
  end

  test 'it requires a gamertag' do
    user = User.new user_attributes.merge(gamertag: nil)
    assert_not user.save, "Saved without a gamertag"
  end

  test 'it requires a unique gamertag' do
    user = User.new user_attributes.merge(gamertag: 'potatoe_user')
    assert_not user.save, "Saved with an existing gamertag"
  end
end
