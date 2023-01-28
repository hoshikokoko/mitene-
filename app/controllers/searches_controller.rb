class SearchesController < ApplicationController
  def search_keyword
    @tag_lists = Tag.all
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model == "staff"
      @records = Staff.search_for(@content, @method).page(params[:page])
    else
      @records = Infomation.search_for(@model, @content, @method).page(params[:page])
    end

  end
  
  def search_tag
    @tag_lists = Tag.all
    @tag = Tag.find(params[:tag_id])
    @infomations = @tag.infomations.page(params[:page])
  end
end
