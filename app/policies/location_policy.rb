class LocationPolicy < ApplicationPolicy
  def new?
    user.admin?
  end

  def create?
    user.admin?
  end

  def permitted_attributes
    if user.admin? || user.normal? || user.owner?
      [:address, :latitude, :longitude]
    end
  end

  class Scope < Scope
  end
end
