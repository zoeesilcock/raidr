require 'test_helper'

class GroupsTest < ActionDispatch::IntegrationTest
  test "that it shows the public groups in the list" do
    get groups_url
    assert_select 'ul#groups li' do |element|
      assert_includes element.text, 'Destiny Sverige', "Public group not shown in list"
    end
  end

  test "that it doesn't show private groups in the list" do
    get groups_url
    assert_select 'ul#groups li' do |element|
      assert_not_includes element.text, 'Destiny Devotees', "Private group shown in list"
    end
  end
end
