class DealPolicy < ApplicationPolicy
  def search?
    permit_all_roles
  end

  def new?
    user.admin? || user.owner?
  end

  def show?
    permit_all_roles
  end

  def index
    #code
  end

  class Scope < Scope
    def resolve
      if (user.admin? || user.normal?)
        scope.all
      elsif user.owner?
        user.deals
      else
        # NOTE: it would be nice to have an attribute of published
        # scope.where{ published: true }
      end
        # scope.all
    end

  end
end
