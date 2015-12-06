class BannsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_permission!
  
  def index
    @users = User.all
  end

  def create
    user = User.find(params[:user_id])
    if user.update(banned: true)
      flash[:notice] = "Successfully banned"
    else
      flash[:notice] = "Something went wrong. Try again."
    end
    redirect_to banns_path
  end

  def revoke
    user = User.find(params[:user_id])
    if user.update(banned: false)
      flash[:notice] = "Successfully revoked bann"
    else
      flash[:notice] = "Something went wrong. Try again."
    end
    redirect_to banns_path
  end

  private
  def check_permission!
    unless current_user.admin?
      flash[:error] = "You don't have permissions to do this!"
      redirect_to root_url
    end
  end
end
