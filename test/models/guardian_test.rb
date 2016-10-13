require 'test_helper'

class GuardianTest < ActiveSupport::TestCase
  def guardian_attributes
    { guardian_class: :titan, enabled: true, user: User.first }
  end

  test "that it requires a user" do
    guardian = Guardian.new guardian_attributes.merge(user: nil)
    assert_not guardian.save, "Saved without a user"
  end
end
