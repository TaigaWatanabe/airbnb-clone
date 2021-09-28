class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @rooms = @user.rooms.where(is_active: true)
  end
end
