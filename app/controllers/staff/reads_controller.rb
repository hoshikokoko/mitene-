class Staff::ReadsController < ApplicationController
      
  def create
    @infomation = Infomation.find(params[:infomation_id])
    read = @infomation.reads.new(staff_id: current_staff.id)
    if read.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
  
  def destroy
    @infomation = Infomation.find(params[:infomation_id])
    read = current_staff.reads.find_by(infomation_id: @infomation.id)
    if read.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
end
