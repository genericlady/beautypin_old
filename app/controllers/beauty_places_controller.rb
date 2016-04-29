class BeautyPlacesController < ApplicationController
  before_filter :authenticate_user!

  def index
    raise "not authorized" unless BeautyPlacePolicy.new(current_user, BeautyPlace).index?
    @beauty_places = BeautyPlacePolicy::Scope.new(current_user, BeautyPlace).resolve
    # if user_signed_in?
    #   @beauty_places = ReviewPolicy::Scope.new(current_user, BeautyPlace).resolve
    # end
    # raise "not authorized" unless BeautyPlacePolicy.new(current_user, BeautyPlace).index?
  end

  def new
  end

  private
  def beauty_place_params
    params.require(:beauty_place).permit(:name)
  end
end
