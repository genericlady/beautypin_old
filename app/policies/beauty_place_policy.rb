class BeautyPlacePolicy
  attr_reader :user, :model

  def initialize(user, model)
    @user = user
    @beauty_place = model
  end

  # reflect the action in controller
  def index?
    # can i make it so an owner can only see beauty_places they own?
    # @beauty_place is nil
    @user.admin? || @user.normal? || @user.owner?
  end

end
