class EmployeePolicy < ApplicationPolicy
  def destroy?
    admin_or_owner_of_record?
  end

  def create?
    user.admin?
  end

  def permitted_attributes
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  private
  def admin_or_owner_of_record?
    user.admin? || user.id == record.user.id
  end
end
