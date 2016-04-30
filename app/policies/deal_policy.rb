class DealPolicy < ApplicationPolicy
  def search?
    permit_all_roles
  end

  def index
    #code
  end

  class Scope < Scope
    def resolve
      if (user.admin? || user.normal?)
        scope.all
      end
      # if user.normal? || user.admin?
      #   binding.pry
      #   scope.search(search_params)
      # end
      # if user.admin?
        scope.all
      # else
      # NOTE: it would be nice to have an attribute of published
      #   scope.where{ published: true }
      # end
    end

  end
end
