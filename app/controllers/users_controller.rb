class UsersController < ApplicationController
  def index
    @users = User.includes(:points).sort { |u1, u2| u2.points.count <=> u1.points.count }
  end
end
