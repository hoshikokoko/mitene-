class Staff::BookmarksController < ApplicationController
    
  def create
    @infomation = Infomation.find(params[:infomation_id])
    bookmark = @infomation.bookmarks.new(staff_id: current_staff.id)
    if bookmark.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
  
  def destroy
    @infomation = Infomation.find(params[:infomation_id])
    bookmark = current_staff.bookmarks.find_by(infomation_id: @infomation.id)
    if bookmark.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
  
  def index
    @tag_lists = Tag.all
    @bookmarks = Bookmark.where(staff_id: current_staff.id).order(id: "DESC").page(params[:page])
  end
end
