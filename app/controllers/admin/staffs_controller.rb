class Admin::StaffsController < ApplicationController
  def index
    @staffs = Staff.page(params[:page])
    @tag_lists = Tag.all
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
      flash[:notice] = "社員情報を編集しました"
      redirect_to admin_staff_path(@staff.id)
    else
      flash[:alert] = "社員情報の編集に失敗しました"
      render :edit
    end
  end

  private
  
  def staff_params
    params.require(:staff).permit(:first_name, :last_name, :email, :is_deleted)
  end
end
