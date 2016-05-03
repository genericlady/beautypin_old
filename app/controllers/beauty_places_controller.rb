class BeautyPlacesController < ApplicationController

  def index
    @beauty_places = policy_scope BeautyPlace
  end

  def new
    @beauty_place = BeautyPlace.new
    authorize @beauty_place
  end

  def create
    @beauty_place = BeautyPlace.new name: beauty_place_params[:name]
    @beauty_place.location = Location.new beauty_place_params[:location]
    @beauty_place.user = current_user
    @beauty_place.save
    authorize @beauty_place
    redirect_to beauty_place_path(@beauty_place)
  end

  def show
    @beauty_place = BeautyPlace.find_by(id: params[:id])
    binding.pry
    @deal = @beauty_place.deals.new
    authorize @beauty_place
  end

  def save
    @beauty_place = BeautyPlace.find_or_create_by  name: beauty_place_params[:name]
    if @beauty_place.user.nil?
      @beauty_place.user = current_user
    end
    @beauty_place.location = Location.new(beauty_place_params[:location])
    @beauty_place.save
    binding.pry
    authorize @beauty_place
    redirect_to beauty_place_path @beauty_place
  end

  def destroy
    @beauty_place = BeautyPlace.find_by id: params[:id]
    authorize @beauty_place
    @beauty_place.delete
    redirect_to beauty_places_path
  end

  private
  def beauty_place_params
    params.require(:beauty_place).permit(:name, :published, location: [:address, :city, :state])
  end
end
