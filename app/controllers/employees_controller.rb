class EmployeesController < ApplicationController

  def destroy
    employee = Employee.find_by id: params[:id]
    authorize employee
    employee.delete
    redirect_to :back, message: 'Employee deleted.'
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
