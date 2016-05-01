class DealsController < ApplicationController

  def index
    @deals = Deal.search(params[:search])
    policy_scope(@deals)
  end

  def search_params
    params.require(:search).permit(policy(Deal).permitted_attributes)
  end
end
