class EmployeesController < ApplicationController

  def index
    @employees = policy_scope Employee
    authorize @employees
  end

  def destroy
    employee = Employee.find_by id: params[:id]
    authorize employee
    employee.delete
    redirect_to :back, message: 'Employee deleted.'
  end

  def edit
    @employee = Employee.find_by id: params[:id]
    authorize @employee
  end

  def update
  end

  def create
    @employee = Employee.create employee_params
    authorize @employee
    redirect_to :back, message: 'Employee created'
  end

  private
  def employee_params
    params.require(:employee).permit(policy(@employee).permitted_attributes)
  end
end
