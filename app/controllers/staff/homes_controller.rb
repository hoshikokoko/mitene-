class Staff::HomesController < ApplicationController
  def top
    @tag_lists = Tag.all
    @infomations = Infomation.all
  end
  
end
