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

  def update?
    user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    user.admin? || user.id == record.user.id
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope < Scope
    def resolve
      scope.all unless !user.admin?
      if user.admin?
        scope.all
      elsif user.owner?
        user.beauty_places
      else
        # return only published beauty_places
      end
    end

  end

  private
  def site_visitor?
    user.nil?
  end
end
