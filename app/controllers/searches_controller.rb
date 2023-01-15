class SearchesController < ApplicationController
  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    @records = Infomation.search_for(@model, @content, @method)
  end
end
