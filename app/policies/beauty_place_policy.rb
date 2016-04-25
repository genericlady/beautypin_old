class BeautyPlacePolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @beauty_place = model
  end

  # reflect the action in controller
  def index?
    @current_user.admin? || @current_user.normal? || @current_user.owner?
  end

end
