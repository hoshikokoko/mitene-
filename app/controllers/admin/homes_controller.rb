class Admin::HomesController < ApplicationController
  def top
    @tag_lists = Tag.all
    @infomations = Infomation.order(id: "DESC").page(params[:page])
  end
end
