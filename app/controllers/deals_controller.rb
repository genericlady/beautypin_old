class DealsController < ApplicationController
  def search
    authorize(Deal)
    # first stop is to select a state and submit it to list_deals
  end

  # POST { :state => 'ny' }
  def list_deals
    # build a scoped collection for a normal user
  end

  private
  # custom params for state
end
