class UsersController < ApplicationController

  def index
    @users = policy_scope(User)
  end

  def show
    @user = User.find_by(id: params[:id])
    authorize @user
  end

  def destroy
    user = User.find_by(id: params[:id])
    authorize user
    user.destroy
    redirect_to users_path, notice: 'User deleted'
  end

  def update
    @user = User.find_by(id: params[:id])
    authorize @user

    if @user.update_attributes(secure_params)
      redirect_to users_path, success: 'User updated'
    else
      redirect_to users_path, alert: 'Unable to update user'
    end
  end

  private
  def secure_params
    params.require(:user).permit(:role)
  end
end
