class DealPolicy < ApplicationPolicy
  def search?
    permit_all_roles
  end

end
