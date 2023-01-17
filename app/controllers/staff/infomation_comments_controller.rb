class Staff::InfomationCommentsController < ApplicationController
  def create
    infomation = Infomation.find(params[:infomation_id])
    comment = current_staff.infomation_comments.new(infomation_comment_params)
    comment.infomation_id = infomation.id
    comment.save
    redirect_to request.referer
  end

  def destroy
    InfomationComment.find_by(id: params[:id], infomation_id: params[:infomation_id]).destroy
    redirect_to request.referer
  end
  
  
  private
  
  def infomation_comment_params
    params.require(:infomation_comment).permit(:comment)
  end
end