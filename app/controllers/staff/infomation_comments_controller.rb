class Staff::InfomationCommentsController < ApplicationController
  def create
    @infomation = Infomation.find(params[:infomation_id])
    @comment = current_staff.infomation_comments.new(infomation_comment_params)
    @comment.infomation_id = @infomation.id
    if @comment.save
      flash[:notice] = "コメントを投稿しました"
      redirect_to request.referer
    else
      flash[:alert] = "コメントを投稿に失敗しました"
      redirect_to request.referer
    end
  end

  def destroy
    @comment = InfomationComment.find_by(id: params[:id], infomation_id: params[:infomation_id])
    @comment.destroy
    flash[:notice] = "コメントを削除しました"
    redirect_to request.referer
  end
  
  
  private
  
  def infomation_comment_params
    params.require(:infomation_comment).permit(:comment)
  end
end
