class Admin::InfomationsController < ApplicationController
  def index
    @tag_lists = Tag.all
    @infomations = Infomation.all
  end

  def show
    @infomation = Infomation.find(params[:id])
    @infomation_tags = @infomation.tags
    @comments = @infomation.infomation_comments
    @reads = Read.where(infomation_id: @infomation.id)
  end
end
