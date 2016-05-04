class DealsController < ApplicationController

  def index
    if params[:search]
      @deals = Deal.search(params[:search])
      # can policy scope take arguments?
      policy_scope(@deals)
    else
      @deals = policy_scope(Deal)
    end
  end

  def new
    @beauty_place = BeautyPlace.find params[:beauty_place_id]
    @deal = @beauty_place.deals.build
    authorize @beauty_place
  end

  def create
    # create with mass assignment
    set_beauty_place
    @deal = @beauty_place.create deals_params
    # choose path helper /beauty_places/id/deals
    binding.pry
  end

  def show
    @deal = Deal.find_by id: params[:id]
    authorize @deal
  end

  def destroy
    @deal = Deal.find_by id: params[:id]
    authorize @deal
    @deal.delete
    redirect_to :back
  end

  private
  def deals_params

  end

  def search_params
    params.require(:search).permit(policy(Deal).permitted_attributes)
  end
end
