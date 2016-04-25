class BeautyPlacePolicy
  attr_reader :user, :model

  def initialize(user, model)
    @user = user
    @beauty_place = model
  end

  # reflect the action in controller
  def index?
    binding.pry
    @user.admin? || @user.normal? || @user == @beauty_place.user
  end

end
