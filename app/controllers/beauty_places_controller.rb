class BeautyPlacesController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized, only: [:index]


  def index
    @beauty_places = BeautyPlace.all
    authorize BeautyPlace
  end

  def new
  end

  private
  def beauty_place_params
    params.require(:beauty_place).permit(:name)
  end
end
