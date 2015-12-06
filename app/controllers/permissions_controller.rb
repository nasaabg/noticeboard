class PermissionsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_permission!
  
  def index
    @users = User.all
  end

  def create
    user = User.find(params[:user_id])
    if user.update(moderator: true)
      flash[:notice] = "Successfully added permission"
    else
      flash[:notice] = "Something went wrong. Try again."
    end
    redirect_to permissions_path
  end

  def revoke
    user = User.find(params[:user_id])
    if user.update(moderator: false)
      flash[:notice] = "Successfully removed permission"
    else
      flash[:notice] = "Something went wrong. Try again."
    end
    redirect_to permissions_path
  end

  private
  def check_permission!
    unless current_user.admin?
      flash[:error] = "You don't have permissions to do this!"
      redirect_to root_url
    end
  end
end
