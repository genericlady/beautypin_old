class EmployeePolicy < ApplicationPolicy
  def destroy?
    admin_or_owner_of_record?
  end

  def create?
    user.admin? || binding.pry
  end

  def permitted_attributes
    if user.admin? || binding.pry
  end

  private
  def admin_or_owner_of_record?
    user.admin? || user.id == record.user.id
  end
end
