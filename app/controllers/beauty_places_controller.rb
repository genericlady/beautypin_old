class BeautyPlacesController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized


  def index
    @beauty_places = BeautyPlace.all
    authorize User
  end

  def new
  end

  private
  def beauty_place_params
    params.require(:beauty_place).permit(:name)
  end
end
