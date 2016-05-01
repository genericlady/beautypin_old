class BeautyPlacesController < ApplicationController

  def index
    # raise "not authorized" unless BeautyPlacePolicy.new(current_user, BeautyPlace).index?
    # @beauty_places = BeautyPlacePolicy::Scope.new(current_user, BeautyPlace).resolve
    @beauty_places = policy_scope BeautyPlace
  end

  def new
  end

  private
  def beauty_place_params
    params.require(:beauty_place).permit(:name)
  end
end
