class OwnersController < ApplicationController
  def deals_edit
    @deal = Deal.find(params[:id])
    authorize @deal
    render 'deals/edit'
  end
end
