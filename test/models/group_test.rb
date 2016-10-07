require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  def group_attributes
    {
      title: 'Our Destiny',
      public: true
    }
  end

  test "that it requires a title" do
    group = Group.new group_attributes.merge(title: nil)
    assert_not group.save, "Saved without a title"
  end

  test "that it requires a unique title" do
    group = Group.new group_attributes.merge(title: "Destiny Devotees")
    assert_not group.save, "Saved with an existing title"
  end

  test "that it can list public groups" do
    public_groups = Group.public_groups
    assert_equal 1, public_groups.length
    assert_equal 'Destiny Sverige', public_groups.first.title
  end
end
