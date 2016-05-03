class BeautyPlacesController < ApplicationController

  def index
    @beauty_places = policy_scope BeautyPlace
  end

  def new
  end

  def show
    @beauty_place = BeautyPlace.find_by(id: params[:id])
    @deal = @beauty_place.deals.new
    authorize @beauty_place
  end

  private
  def beauty_place_params
    params.require(:beauty_place).permit(:name)
  end
end
