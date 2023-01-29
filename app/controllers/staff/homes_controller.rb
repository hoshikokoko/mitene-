class Staff::HomesController < ApplicationController
  def top
    @tag_lists = Tag.all
    @priority_infomations = Infomation.where(priority: true)
    @infomations = Infomation.where(priority: false)
  end
  
end
