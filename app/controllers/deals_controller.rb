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
    @deal = Deal.new
    authorize @deal
  end

  def show
    @deal = Deal.find_by id: params[:id]
    authorize @deal
  end

  def destroy
    @deal = Deal.find_by id: params[:id]
    binding.pry
    authorize @deal
    @deal.delete
    redirect_to :back
  end

  def search_params
    params.require(:search).permit(policy(Deal).permitted_attributes)
  end
end
