class UserPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  # reflect the action in controller
  def index?
    @current_user.admin?
  end

  def show?
    @current_user.admin? || @current_user == @user
  end
end