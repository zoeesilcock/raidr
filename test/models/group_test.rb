require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  def group_attributes
    {
      title: 'Our Destiny',
      public: true
    }
  end

  test "it requires a title" do
    group = Group.new group_attributes.merge(title: nil)
    assert_not group.save, 'Saved without a title'
  end
end
