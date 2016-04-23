class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
    redirect_to users_path, notice: 'User deleted'
  end
end
