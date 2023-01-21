class SearchesController < ApplicationController
  def search_keyword
    @tag_list=Tag.all
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    @records = Infomation.search_for(@model, @content, @method).page(params[:page])
  end
  
  def search_tag
    @tag_list=Tag.all
    @tag = Tag.find(params[:tag_id])
    @infomations = @tag.infomations.page(params[:page])
  end
end
