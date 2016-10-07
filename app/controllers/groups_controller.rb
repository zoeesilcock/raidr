class GroupsController < ApplicationController
  def show
    @group = Group.find params[:id]
  end

  def index
    @groups = Group.public_groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new group_params

    if @group.save
      redirect_to @group
    else
      render :new
    end
  end

  def edit
    @group = Group.find params[:id]
  end

  def update
    @group = Group.find params[:id]

    if @group.update_attributes group_params
      redirect_to @group
    else
      render :edit
    end
  end

  private

  def group_params
    params.require(:group).permit(:title, :description, :public)
  end
end
