class GroupsController < ApplicationController
  def index
    @groups = Group.public_groups
  end
end
