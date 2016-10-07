require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  def group_attributes
    { title: "Test group", description: "A super fabulous test group." }
  end

  test "that it gets show" do
    get group_url(Group.first)
    assert_response :success
  end

  test "that it gets index" do
    get groups_url
    assert_response :success
  end

  test "that it gets new" do
    get new_group_url
    assert_response :success
  end

  test "that it creates a new group" do
    assert_difference('Group.count') do
      post groups_url, params: { group: group_attributes }
    end
  end

  test "that it gets edit" do
    get edit_group_url(Group.first)
    assert_response :success
  end

  test "that it updates the group" do
    group = Group.first
    new_title = "A new title"
    new_description = "A new description"

    put group_url(group), params: { group: { title: new_title, description: new_description } }
    group.reload

    assert_equal new_title, group.title, "Title didn't change"
    assert_equal new_description, group.description, "Description didn't change"
  end
end
