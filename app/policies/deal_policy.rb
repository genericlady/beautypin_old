class DealPolicy < ApplicationPolicy
  attr_reader :user, :deal, :beauty_place

  def initialize(user, deal, beauty_place = nil)
    @user = user
    @deal = deal
    @beauty_place = beauty_place
  end

  def deals_edit?
    update?
  end

  def deals?
    user.normal? || user.admin?
  end

  def discount?
    user.normal?
  end

  def search?
    permit_all_roles
  end

  def new?
    user.admin? || user.owner?
  end

  def show?
    permit_all_roles
  end

  def index?
    user.admin? || user.normal? || user.owner?
  end

  def create?
    update?
  end

  def update?
    user.admin? || user.id == deal.user_id
  end

  def destroy?
    user.admin? || user.id == deal.user_id
  end

  def permitted_attributes(beauty_place)
    [:title, :description, :discount] if (user.admin? || user.id == beauty_place.user.id)
  end

  class Scope < Scope
    attr_reader :user, :deals, :beauty_place

    def initialize(user, deals, beauty_place=nil)
      @user = user
      @deals = deals
      @beauty_place = beauty_place
    end

    def resolve
      if user.admin?
        deals
      elsif user.normal?
        deals
      elsif user.owner?
        user.deals
      end
    end

  end

end
