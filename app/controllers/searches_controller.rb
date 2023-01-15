class SearchesController < ApplicationController
  def search_keyword
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    @records = Infomation.search_for(@model, @content, @method)
  end
  
  def search_tag
    @tag_list=Tag.all
    @tag = Tag.find(params[:tag_id])
    @infomations = @tag.infomations
  end
end
