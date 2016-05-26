class BeautyPlacePolicy < ApplicationPolicy

  def index?
    user.admin? || user.normal? || user.owner?
  end

  def show?
    user.admin? || user.id == record.user.id || user.normal?
  end

  def save?
    create?
  end

  def new?
    create?
  end

  def create?
    user.admin? || user.owner?
  end

  def edit?
    update?
  end

  def update?
    user.admin? || beauty_place_owner?
  end

  def destroy?
    user.admin? || beauty_place_owner?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  def beauty_place_owner?
    user.id == record.user.id
  end

  class Scope < Scope
    def resolve
      scope.all unless !user.admin?
      if user.admin?
        scope.all
      elsif user.owner?
        user.beauty_places
      else
        scope.where(published: true)
      end
    end

  end

  private
  def site_visitor?
    user.nil?
  end
end
