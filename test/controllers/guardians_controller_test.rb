require 'test_helper'

class GuardiansControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = login_user
  end

  def guardian_attributes
    { user_id: @user.id, guardian_class: Guardian.guardian_classes.keys.first }
  end

  test "that it creates a guardian" do
    assert_difference('Guardian.count') do
      post guardians_url, params: { guardian: guardian_attributes }
    end

    assert_redirected_to profile_url
  end
end
