class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:add_point, :remove_point]
  def index
    @rewarded_users_ids = current_user ? current_user.given_points.map { |p| p.receiver.id } : []
    @users = User.all.sort { |u1, u2| u2.received_points.count <=> u1.received_points.count }
  end

  def add_point
    receiver = User.find(params[:user_id])
    if receiver == current_user
      flash[:error] = "You can not add points to yourself!"
    else
      flash[:notice] = "Point added!"
      Point.create(receiver: receiver, rewarder: current_user)
    end
    redirect_to users_url
  end

  def remove_point
    receiver = User.find(params[:user_id])
    if receiver == current_user
      flash[:error] = "You can not remove your own points!"
    else
      point = receiver.received_points.find { |p| p.rewarder == current_user }
      point.try(:destroy)
      flash[:notice] = "Point removed!"
    end
    redirect_to users_url
  end
end
