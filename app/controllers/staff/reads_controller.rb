class Staff::ReadsController < ApplicationController
      
  def create
    @infomation = Infomation.find(params[:infomation_id])
    read = @infomation.reads.new(staff_id: current_staff.id)
    if read.save
      flash[:notice] = "既読しました"
      redirect_to request.referer
    else
      flash[:alert] = "既読に失敗しました"
      redirect_to request.referer
    end
  end
  
  def destroy
    @infomation = Infomation.find(params[:infomation_id])
    read = current_staff.reads.find_by(infomation_id: @infomation.id)
    if read.destroy
      flash[:notice] = "既読をはずしました"
      redirect_to request.referer
    else
      flash[:alert] = "既読をはずすのに失敗しました"
      redirect_to request.referer
    end
  end
end
