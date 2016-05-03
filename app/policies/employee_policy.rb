class EmployeePolicy < ApplicationPolicy
  def destroy?
    binding.pry
    user.admin?
  end
end
