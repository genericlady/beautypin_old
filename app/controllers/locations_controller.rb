class LocationsController < ApplicationController
  def index
    if params[:search].present?
      @locations = Location.near(params[:search], 50, :order => :distance)
    else
      @locations = Location.all
    end
    scope_policy @locations
  end

  def new
    @location = Location.new
    authorize @location
  end

  def index
    if params[:search].present?
      binding.pry
      # { search: { state: 'ny' } }
      @locations = Location.find_by params[:search]
      @locations = Location.near(params[:search], 50, order: :distance)
    else
      binding.pry
      @locations = Location.all
    end
    binding.pry
    policy_scope(@locations)
  end

  def show
    @location = Location.find(params[:id])
    authorize @location
  end

  def create
    @location = Location.new(permitted_attributes(Location))
    if @location.save
      authorize @location
      redirect_to @location, :notice => "Successfully created location."
    else
      authorize Location
      render :action => 'new'
    end
  end

  def edit
    @location = Location.find(params[:id])
    authorize @location
  end

  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(params[:location])
      authorize @location
      redirect_to @location, :notice  => "Successfully updated location."
    else
      authorize Location
      render :action => 'edit'
    end
  end

  def destroy
    @location = Location.find(params[:id])
    authorize @location
    @location.destroy
    redirect_to locations_url, :notice => "Successfully destroyed location."
  end

  private
  def location_params
    params.require(:location).permit(policy(@location).permitted_attributes)
  end
end
