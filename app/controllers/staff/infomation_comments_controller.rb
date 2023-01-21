class Staff::InfomationCommentsController < ApplicationController
  def create
    @infomation = Infomation.find(params[:infomation_id])
    @comment = current_staff.infomation_comments.new(infomation_comment_params)
    @comment.infomation_id = @infomation.id
    if @comment.save
      @infomation.create_notification_comment!(current_staff, @comment.id)
    end
    
    redirect_to request.referer
  end

  def destroy
    @comment = InfomationComment.find_by(id: params[:id], infomation_id: params[:infomation_id])
    @comment.destroy
    redirect_to request.referer
  end
  
  
  private
  
  def infomation_comment_params
    params.require(:infomation_comment).permit(:comment)
  end
end
