class EmployeesController < ApplicationController

  def destroy
    employee = Employee.find_by id: params[:id]
    authorize employee
    employee.delete
    redirect_to employees_path, message: 'Employee deleted.'
  end
end
