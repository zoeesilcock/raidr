require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  def group_attributes
    { title: "Test group", description: "A super fabulous test group." }
  end

  test "that it gets show" do
    login_user
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

  test "that it renders the form if the group is invalid" do
    post groups_url, params: { group: group_attributes.merge(title: nil) }
    assert_template :new
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

  test "that it renders the edit form if the group is invalid" do
    group = Group.first
    put group_url(group), params: { group: { title: nil } }
    assert_template :edit
  end

  test "that a user can join a group" do
    login_user

    group = Group.last
    user = User.first

    get group_join_url(group)
    assert_redirected_to group

    user.reload
    assert_equal 2, user.groups.length, "Group count is wrong"
  end

  test "that a user can leave a group" do
    login_user

    group = Group.first
    user = User.first

    get group_leave_url(group)
    assert_redirected_to root_url

    user.reload
    assert_equal 0, user.groups.length, "Group count is wrong"
  end
end
