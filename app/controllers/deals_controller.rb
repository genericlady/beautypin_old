class DealsController < ApplicationController

  def index
    @deals = Deal.search(params[:search]).page params[:page]
    @deals = policy_scope(@deals)

    respond_to do |format|
      format.html
      format.json { render json: @deals }
    end
  end

  def edit
    @deal = Deal.find(params[:id])
    @beauty_place = @deal.beauty_place
    authorize @deal
    respond_to do |format|
      format.html
      format.json { render json: { deal: @deal } }
    end
  end


  def new
    @beauty_place = BeautyPlace.find params[:beauty_place_id]
    @deal = @beauty_place.deals.build
    authorize @beauty_place
    respond_to do |format|
      format.html
      format.json { render json: { deal: @deal } }
    end
  end

  def create
    @beauty_place = BeautyPlace.find(params[:beauty_place_id])
    @deal = @beauty_place.deals.create deal_params @beauty_place
    authorize @deal
    respond_to do |format|
      if @beauty_place.valid?
        url = beauty_place_deal_path id: @deal.id
        format.html { redirect_to url, notice: 'Deal was successfully created.' }
        format.js
        format.json { render json: @deal, status: :created, location: @deal }
      else
        format.html { render action: "new" }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @beauty_place = BeautyPlace.find_by(params[:beauty_place_id])
    @deal = @beauty_place.deals.find params[:id]
    authorize @deal
    respond_to do |format|
      if @deal.update_attributes(deal_params(@beauty_place))
        format.html { render :show, :layout => false }
        format.json { render :json => @deal }
      else
        format.html { render :edit, :layout => false }
      end
    end
  end

  def show
    @deal = Deal.find_by id: params[:id]
    authorize @deal
    respond_to do |format|
      format.html { render layout: false }
      format.js
      format.json { render json: @deal.to_json(include: [:beauty_place]) }
    end
  end

  def destroy
    @deal = Deal.find_by id: params[:id]
    authorize @deal
    @deal.delete
    # respond_to do |format|
    #   format.html { render :index, layout: false }
    # end
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
