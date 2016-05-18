class DealsController < ApplicationController

  def index
    if current_user.owner? && !params[:beauty_place_id].nil?
      @beauty_place = BeautyPlace.find params[:beauty_place_id]
      if @beauty_place.deals.empty?
        @deals = @beauty_place.deals
        skip_policy_scope
      else
        @deals = policy_scope(@beauty_place.deals)
      end
    elsif params[:search]
      @deals = Deal.search(params[:search])
      @deals = policy_scope(@deals)
    else
      @deals = policy_scope(Deal)
    end
  end

  def edit
    @beauty_place = BeautyPlace.find_by id: params[:beauty_place_id]
    @deal = @beauty_place.deals.find_by id: params[:id]
    authorize @deal
  end

  def new
    @beauty_place = BeautyPlace.find params[:beauty_place_id]
    @deal = @beauty_place.deals.build
    authorize @beauty_place
  end

  def create
    @beauty_place = BeautyPlace.find(params[:beauty_place_id])
    @deal = @beauty_place.deals.create deal_params @beauty_place
    authorize @deal
    if @beauty_place.valid?
      redirect_to beauty_place_deal_path id: @deal.id
    else
      render :new
    end
  end

  def update
    @beauty_place = BeautyPlace.find_by(params[:beauty_place_id])
    @deal = @beauty_place.deals.find params[:id]
    if @deal.update_attributes(deal_params(@beauty_place))
      authorize @deal
      redirect_to beauty_place_deal_path
    else
    binding.pry
      authorize @deal
      render :edit
    end

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
  def deal_params(beauty_place)
    params.require(:deal).permit(policy(Deal).permitted_attributes(beauty_place))
  end

  def search_params
    params.require(:search).permit(policy(Deal).permitted_attributes)
  end
end
