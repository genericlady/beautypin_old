class DealsController < ApplicationController

  def index
    @deals = Deal.search(params[:search])
    binding.pry
    policy_scope(@deals)
  end

  def search_params
    params.require(:search).permit(policy(Deal).permitted_attributes)
  end
end
