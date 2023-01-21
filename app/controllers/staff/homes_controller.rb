class Staff::HomesController < ApplicationController
  def top
    @tag_list = Tag.all
    @infomations = Infomation.all
  end
  
end
