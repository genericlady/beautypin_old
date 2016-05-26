class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  before_filter :authenticate_user!
  after_action :verify_authorized, except: [:index, :deals, :discount_descending, :discount_ascending]
  after_action :verify_policy_scoped, only: [:index, :deals, :discount_descending, :discount_ascending]
  protect_from_forgery with: :exception

  private
  def user_not_authorized
    flash[:alert] = 'Access denied.'
    redirect_to (request.referrer || root_path)
  end

end
