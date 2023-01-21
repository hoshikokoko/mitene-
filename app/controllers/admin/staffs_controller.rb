class Admin::StaffsController < ApplicationController
  def index
    @staffs = Staff.all
  end

  def show
    @staff = Staff.find(params[:id])
  end

  def edit
    @staff = Staff.find(params[:id])
  end

  def update
    @staff = Staff.find(params[:id])
    if @staff.update(staff_params)
      redirect_to admin_staff_path(@staff.id)
    else
      render :edit
    end
  end

  private
  
  def staff_params
    params.require(:staff).permit(:first_name, :last_name, :email, :is_deleted)
  end
end
