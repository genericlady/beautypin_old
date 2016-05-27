class SearchController < ApplicationController
  def deals
    @deals = policy_scope(Deal.search(params[:search]))

    respond_to do |format|
      format.json { render json: { deals: @deals, include: 'beauty_place' } }
      format.html { render 'deals/index' }
    end
  end

  def discount_descending
    @deals = policy_scope(Deal.search(params[:search])
                              .page(params[:page])
                              .order(discount: :desc))

    respond_to do |format|
      format.json { render json: { deals: @deals }, include: 'beauty_place' }
      format.html { render 'deals/index' }
    end

  end

  def discount_ascending
    @deals = policy_scope(Deal.search(params[:search]))

    respond_to do |format|
      format.json { render json: { deals: @deals.order(discount: :asc), include: 'beauty_place' } }
      format.html { render 'deals/index' }
    end
  end
end
