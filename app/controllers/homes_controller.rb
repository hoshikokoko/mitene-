class HomesController < ApplicationController
  def top
    @tag_list = Tag.all
  end
  
end
