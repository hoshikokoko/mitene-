class Admin::HomesController < ApplicationController
  def top
    @tag_lists = Tag.all
    @infomations = Infomation.page(params[:page])
  end
end
