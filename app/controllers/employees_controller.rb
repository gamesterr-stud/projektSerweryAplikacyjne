class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      flash[:notice] = 'Pracownik został utworzony'
      redirect_to employees_path
    else
      flash[:alert] = 'Coś poszło nie tak'
      render :new
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      flash[:notice] = 'Pracownik został zaktualizowany'
      redirect_to employees_path
    else
      flash[:alert] = 'Coś poszło nie tak'
      render :edit
    end
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def destroy
    @employee = Employee.find(params[:id])
    if @employee.destroy
      flash[:notice] = 'Pracownik został usunięty'
    else
      flash[:alert] = 'Coś poszło nie tak'
    end
    redirect_to employees_path
end

  def employee_params
    params.require(:employee).permit(:firstName, :lastName)
  end
end

