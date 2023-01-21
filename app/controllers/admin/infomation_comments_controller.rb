class Admin::InfomationCommentsController < ApplicationController
  
  def destroy
    @comment = InfomationComment.find_by(id: params[:id], infomation_id: params[:infomation_id])
    @comment.destroy
    redirect_to request.referer
  end
end
